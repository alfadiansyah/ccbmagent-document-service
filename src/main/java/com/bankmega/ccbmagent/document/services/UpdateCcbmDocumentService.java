package com.bankmega.ccbmagent.document.services;

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

import com.bankmega.ccbmagent.document.mappers.updateCcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.UpdateDocumentRequest;

@Service
public class UpdateCcbmDocumentService {

    @Autowired
    private updateCcbmDocumentMapper mapper;

    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024; // 3MB in bytes

    public void updateAttachment(UpdateDocumentRequest request) throws IOException {
        
        // Define file metadata
        String fileName = request.getFile().getOriginalFilename();
        long fileSize = request.getFile().getSize();
        String fileType = request.getFile().getContentType();
        String path = "storage/" + getPathFromDate(); // Define path based on the date

        // Save the file to the defined path
        saveFile(request.getFile(), path);

        // Update vtiger_crmentity
        mapper.updateVtigerCrmEntity(
                request.getAssignTo(),
                request.getUserId(),
                request.getDocumentId());

        // Update vtiger_notes
        mapper.updateVtigerNotes(
                request.getFileLocationType(),
                fileName,
                request.getFileStatus() ? 1 : 0, // Assuming fileStatus is Boolean, convert to int
                request.getFileVersion(),
                Integer.parseInt(request.getFolderId()), // Assuming folderId is String but should be Integer
                request.getDescriptionAttachment(),
                request.getTitle(),
                request.getDocumentId());

        // Delete old records in vtiger_seattachmentsrel
        mapper.deleteFromSeAttachmentsRel(request.getDocumentId());
        mapper.updateSequenceId();
        
        // Insert new record in vtiger_seattachmentsrel
        mapper.insertIntoSeAttachmentsRel(request.getDocumentId(), getLastInsertId());

        // Optionally, handle owner notify updates if needed
        mapper.deleteOwnerNotifyByCrmId(request.getDocumentId());
        mapper.insertOwnerNotify(request.getDocumentId(), request.getAssignTo());
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
        return mapper.getLastInsertId();
    }
}
