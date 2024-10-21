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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bankmega.ccbmagent.document.mappers.GioMapper;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.UpdateDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.GetAssigntoAttachmentResponse;

@Service
public class GioService {

    private final GioMapper gioMapper;
    private final Set<String> whitelistedIps = new HashSet<>();
    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024; // 3MB in bytes

    @Autowired
    public GioService(GioMapper gioMapper) {
        this.gioMapper = gioMapper;
        reloadWhitelistedIps("api_attachment"); // Load initial IPs
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
            long fileSize = file.getSize();
            String fileType = file.getContentType();
            String path = "storage/" + getPathFromDate(); // Define path based on the date
    
            // Menyimpan file yang diupload
            saveFile(file, path);
    
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
        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    
        // Mendapatkan nama file dan membuat nama file unik
        String originalFilename = file.getOriginalFilename();
        String newFilename = generateUniqueFilename(path, originalFilename);
    
        // Menyimpan file di direktori yang sudah ditentukan
        Files.copy(file.getInputStream(), Paths.get(path, newFilename), StandardCopyOption.REPLACE_EXISTING);
    }
    
    private String generateUniqueFilename(String path, String originalFilename) {
        String filename = originalFilename;
        String extension = "";
        int dotIndex = originalFilename.lastIndexOf('.');
        if (dotIndex > 0) {
            filename = originalFilename.substring(0, dotIndex);
            extension = originalFilename.substring(dotIndex);
        }
    
        // Menyusun nama file dengan ID yang unik
        filename = filename.replace(" ", "_");
        gioMapper.updateSequenceId();
        long lastSequenceId = getLastInsertId();
    
        String newFilename = lastSequenceId + "_" + filename + extension;
    
        // Menangani konflik jika nama file sudah ada
        File file = new File(path, newFilename);
        int count = 1;
        while (file.exists()) {
            newFilename = lastSequenceId + "_" + filename + "(" + count + ")" + extension;
            file = new File(path, newFilename);
            count++;
        }
    
        return newFilename;
    }
    
    private String getPathFromDate() {
        // Membuat path berdasarkan tahun, bulan, dan minggu
        String year = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
        String month = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM"));
        String week = "week" + LocalDate.now().format(DateTimeFormatter.ofPattern("W"));
    
        return year + "/" + month + "/" + week;
    }
    
    private long getLastInsertId() {
        // Mengambil ID terakhir yang dimasukkan
        return gioMapper.getLastInsertId();
    }

}