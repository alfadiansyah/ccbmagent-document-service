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

    // Unified mapper for all functionalities
    private final GioMapper gioMapper;

    // Variables for IP whitelisting
    private final Set<String> whitelistedIps = new HashSet<>();

    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024; // 3MB in bytes

    @Autowired
    public GioService(GioMapper gioMapper) {
        this.gioMapper = gioMapper;
        reloadWhitelistedIps("api_attachment"); // Load initial IPs
    }


    // GET FOLDER
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

    // Method to get combined user and division data
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

    // Method for reloading whitelisted IPs
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

    // Method to update document attachment
    public void updateAttachment(UpdateDocumentRequest request) throws IOException {

        // Define file metadata
        String fileName = request.getFile().getOriginalFilename();
        long fileSize = request.getFile().getSize();
        String fileType = request.getFile().getContentType();
        String path = "storage/" + getPathFromDate(); // Define path based on the date

        // Save the file to the defined path
        saveFile(request.getFile(), path);

        // Update vtiger_crmentity
        gioMapper.updateVtigerCrmEntity(
                request.getAssignTo(),
                request.getUserId(),
                request.getDocumentId());

        // Update vtiger_notes
        gioMapper.updateVtigerNotes(
                request.getFileLocationType(),
                fileName,
                request.getFileStatus() ? 1 : 0, // Assuming fileStatus is Boolean, convert to int
                request.getFileVersion(),
                Integer.parseInt(request.getFolderId()), // Assuming folderId is String but should be Integer
                request.getDescriptionAttachment(),
                request.getTitle(),
                request.getDocumentId());

        // Delete old records in vtiger_seattachmentsrel
        gioMapper.deleteFromSeAttachmentsRel(request.getDocumentId());
        gioMapper.updateSequenceId();
        
        // Insert new record in vtiger_seattachmentsrel
        gioMapper.insertIntoSeAttachmentsRel(request.getDocumentId(), getLastInsertId());

        // Optionally, handle owner notify updates if needed
        gioMapper.deleteOwnerNotifyByCrmId(request.getDocumentId());
        gioMapper.insertOwnerNotify(request.getDocumentId(), request.getAssignTo());
    }

    private void saveFile(MultipartFile file, String path) throws IOException {
        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        String originalFilename = file.getOriginalFilename();
        String newFilename = generateUniqueFilename(path, originalFilename);

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

        // Replace spaces with underscores in the filename
        filename = filename.replace(" ", "_");

        // Add LastSequenceID to the filename
        long lastSequenceId = getLastInsertId();
        String newFilename = lastSequenceId + "_" + filename + extension;

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
        String year = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
        String month = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM"));
        String week = "week" + LocalDate.now().format(DateTimeFormatter.ofPattern("W"));

        return year + "/" + month + "/" + week;
    }

    private long getLastInsertId() {
        return gioMapper.getLastInsertId();
    }
}
