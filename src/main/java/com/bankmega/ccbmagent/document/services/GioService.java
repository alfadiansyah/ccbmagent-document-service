package com.bankmega.ccbmagent.document.services;

import java.util.*;
import java.util.stream.Collectors;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bankmega.ccbmagent.document.mappers.GioMapper;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.UpdateDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.GetAssigntoAttachmentResponse;
import com.bankmega.ccbmagent.document.model.responses.GetFolderResponse;

import mampang.validation.dto.MampangApiResponse;

@Service
public class GioService {

    private final GioMapper gioMapper;
    private final Set<String> whitelistedIps = new HashSet<>();
    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024; // 3MB in bytes
	private final Log log = LogFactory.getLog(getClass());

    @Autowired
    public GioService(GioMapper gioMapper) {
        this.gioMapper = gioMapper;
        reloadWhitelistedIps("api_attachment"); // Load initial IPs
    }

    public HttpEntity<MampangApiResponse> getFolders() {
        try {
            // Retrieve the list of folders from the mapper
            List<GetFolderResponse> folders = gioMapper.getFolders();
            // logger.debug("Retrieved folders: {}", folders);
			
            // Create a response object
            MampangApiResponse response = new MampangApiResponse(folders, "00", "Success");
            response.setRc("00");
            response.setRd("Success");
            response.setData(folders);
            
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            // Handle error and create an error response object
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error retrieving folders");
			// logger.error("Error retrieving folders", e);
			errorResponse.setRc("01");
            errorResponse.setRd("Error retrieving folders");
            errorResponse.setData(e.getMessage());
            
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public GetAssigntoAttachmentResponse getCombinedUserAndDivisionData(String channel) {
        List<GetAssigntoAttachmentBankMegaRequest> bankMegaUsers = new ArrayList<>();
        List<GetAssigntoAttachmentSyariahBankMegaRequest> syariahBankMegaUsers = new ArrayList<>();
        List<GetAssigntoAttachmentDivision> divisions = new ArrayList<>();

        switch (channel) {
            case "Bank Mega":
                bankMegaUsers = gioMapper.getActiveUsersForBankMega()
                    .stream()
                    .filter(user -> user.getUserName() != null && !user.getUserName().isEmpty())
                    .collect(Collectors.toList());
                break;
            case "Mega Syariah":
                syariahBankMegaUsers = gioMapper.getActiveUsersForMegaSyariah()
                    .stream()
                    .filter(user -> user.getUserName() != null && !user.getUserName().isEmpty())
                    .collect(Collectors.toList());
                break;
            default:
                throw new IllegalArgumentException("Invalid channel: " + channel);
        }
        divisions = gioMapper.getActiveDivisions();

        return GetAssigntoAttachmentResponse.builder()
                .userData(channel.equals("Bank Mega") ? bankMegaUsers : syariahBankMegaUsers)
                .divisiData(divisions)
                .build();
    }

    public void reloadWhitelistedIps(String accessFunction) {
        try {
            List<String> ipList = gioMapper.getWhitelistedIpsByFunction(accessFunction);
            whitelistedIps.clear();
            whitelistedIps.addAll(ipList);
            System.out.println("Whitelisted IPs reloaded: " + whitelistedIps);
        } catch (Exception e) {
            System.err.println("Error loading whitelisted IPs: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean isIpWhitelisted(String ip) {
        return whitelistedIps.contains(ip);
    }

    public void updateAttachment(UpdateDocumentRequest request) throws IOException {
        // Cek apakah file kosong
        if (request.getFile() == null || request.getFile().isEmpty()) {
            // File kosong, update semua field kecuali file-related
            gioMapper.updateVtigerCrmEntity(
                    request.getAssignTo(),
                    request.getUserId(),
                    request.getDocumentId());
    
            gioMapper.updateVtigerNotes(
                    request.getFileLocationType(),
                    null, // Tidak ada file yang diupdate
                    request.getFileStatus() ? 1 : 0,
                    request.getFileVersion(),
                    Integer.parseInt(request.getFolderId()),
                    request.getDescriptionAttachment(),
                    request.getTitle(),
                    request.getDocumentId());
    
            // Hapus dan update owner notify
            gioMapper.deleteOwnerNotifyByCrmId(request.getDocumentId());
            gioMapper.insertOwnerNotify(request.getDocumentId(), request.getAssignTo());
    
            return;
        }
    
        // Jika file ada, proses penyimpanan dan update data terkait file
        MultipartFile file = request.getFile();
        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            gioMapper.updateSequenceId();
            long lastInsertId = getLastInsertId(); // Get last insert ID
    
            long fileSize = file.getSize();
            String fileType = file.getContentType();
            String path = "/data/document-service/storage/"; // Base path defined in application.yml
            String datePath = getPathFromDate(); // Get formatted date path
    
            String fullPath = path + datePath; // Combine base path with date path
    
            // Menyimpan file yang diupload
            saveFile(file, fullPath);
            
            int insertCrmEntityResult = gioMapper.insertVtigerCrmentity(
                lastInsertId, request.getUserId(), request.getAssignTo());
            if (insertCrmEntityResult <= 0) {
                throw new RuntimeException("Failed to insert into vtiger_crmentity");
            }
    
            // Update vtiger_crmentity
            gioMapper.updateVtigerCrmEntity(
                    request.getAssignTo(),
                    request.getUserId(),
                    request.getDocumentId());
    
            // Update vtiger_notes
            gioMapper.updateVtigerNotes(
                    request.getFileLocationType(),
                    fileName,
                    request.getFileStatus() ? 1 : 0,
                    request.getFileVersion(),
                    Integer.parseInt(request.getFolderId()),
                    request.getDescriptionAttachment(),
                    request.getTitle(),
                    request.getDocumentId());
    
            // Insert ke vtiger_attachments
            gioMapper.insertVtigerAttachment(
                lastInsertId, // Mendapatkan ID terakhir yang di-generate oleh sequence
                fileName.replace(" ", "_"), // Nama file dengan spasi diganti garis bawah
                null, // Deskripsi (kosong atau null)
                fileType, // Tipe file
                fullPath // Path file
            );
    
            // Delete dan reinsert attachment relation
            gioMapper.deleteFromSeAttachmentsRel(request.getDocumentId());
            gioMapper.insertIntoSeAttachmentsRel(request.getDocumentId(), getLastInsertId());
    
            // Update owner notify
            gioMapper.deleteOwnerNotifyByCrmId(request.getDocumentId());
            gioMapper.insertOwnerNotify(request.getDocumentId(), request.getAssignTo());
        }
    }
    
    
    private void saveFile(MultipartFile file, String path) throws IOException {
        // Membuat direktori jika tidak ada
        System.out.println("Saving file to path: " + path);

        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        // gioMapper.updateSequenceId();
        long lastInsertId = getLastInsertId();

        // Mendapatkan nama file dan membuat nama file unik
        String originalFilename = file.getOriginalFilename();
        String newFilename = generateUniqueFilename(path, originalFilename,lastInsertId);
    
        // Menyimpan file di direktori yang sudah ditentukan
        Files.copy(file.getInputStream(), Paths.get(path, newFilename), StandardCopyOption.REPLACE_EXISTING);
        System.out.println("File saved successfully: " + newFilename);

    }
    private String generateUniqueFilename(String path, String originalFilename, long lastInsertId) {
        String filename = originalFilename;
        String extension = "";
        int dotIndex = originalFilename.lastIndexOf('.');
        if (dotIndex > 0) {
            filename = originalFilename.substring(0, dotIndex);
            extension = originalFilename.substring(dotIndex);
        }
    
        // Menyusun nama file dengan lastInsertId yang unik
        filename = filename.replace(" ", "_");
        System.out.println("+++++++++++++++ "+filename);
        // Gunakan lastInsertId sebagai bagian dari nama file
        String newFilename = lastInsertId + "_" + filename + extension;
        System.out.println(newFilename);
        // Menangani konflik jika nama file sudah ada
        File file = new File(path, newFilename);
        int count = 1;
        while (file.exists()) {
            newFilename = lastInsertId + "_" + filename + "(" + count + ")" + extension;
            file = new File(path, newFilename);
            count++;
        }
    
        System.out.println("++++++++++"+newFilename);
        return newFilename;
    }
    
    
    private String getPathFromDate() {
        // Membuat path berdasarkan tahun, bulan, dan minggu
        String year = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
        String month = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM"));
        String week = "week" + LocalDate.now().format(DateTimeFormatter.ofPattern("W"));
    
        return year + "/" + month + "/" + week + "/";
    }
    
    private long getLastInsertId() {
        // Mengambil ID terakhir yang dimasukkan
        return gioMapper.getLastInsertId();
    }

}