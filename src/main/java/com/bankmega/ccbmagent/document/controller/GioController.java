package com.bankmega.ccbmagent.document.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bankmega.ccbmagent.document.model.requests.UpdateDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.GetAssigntoAttachmentResponse;
import com.bankmega.ccbmagent.document.services.GioService;

import mampang.validation.dto.MampangApiResponse;

@RestController
@RequestMapping("/ccbm/document")
public class GioController {

    private static final Logger logger = LoggerFactory.getLogger(GioController.class);
    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024; // 3MB in bytes

    private final GioService gioService;

    @Autowired
    public GioController(GioService gioService) {
        this.gioService = gioService;
    }

    // GET FOLDER
    @GetMapping("/folders-attachments")
    public HttpEntity<MampangApiResponse> getFolders() {
        // Call the service method and return its result
        return gioService.getFolders();
    }

    // Endpoint for getting assignment data
    @GetMapping("/attachment/data")
    public ResponseEntity<GetAssigntoAttachmentResponse> getAssignmentData(
            @RequestParam("channel") String channel) {
        try {
            GetAssigntoAttachmentResponse response = gioService.getCombinedUserAndDivisionData(channel);
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    // Endpoint for updating document
    @PostMapping("/update")
    public HttpEntity<MampangApiResponse> updateDocument(
            @RequestParam("documentId") long documentId,
            @RequestParam("assignTo") String assignTo,
            @RequestParam("userId") String userId,
            @RequestParam("title") String title,
            @RequestParam("descriptionAttachment") String descriptionAttachment,
            @RequestParam("file") MultipartFile file,
            @RequestParam("fileStatus") Boolean fileStatus,
            @RequestParam("folderId") String folderId,
            @RequestParam("fileVersion") String fileVersion,
            @RequestParam("fileLocationType") String fileLocationType) {

        // Log request parameters
        logger.info("Received request to update document:");
        logger.info("documentId: {}", documentId);
        logger.info("assignTo: {}", assignTo);
        logger.info("userId: {}", userId);
        logger.info("title: {}", title);
        logger.info("descriptionAttachment: {}", descriptionAttachment);
        logger.info("fileStatus: {}", fileStatus);
        logger.info("folderId: {}", folderId);
        logger.info("fileVersion: {}", fileVersion);
        logger.info("fileLocationType: {}", fileLocationType);
        
        MampangApiResponse response = new MampangApiResponse("data", "00", "Success");

        try {
            // Validate file size
            if (file.getSize() > MAX_FILE_SIZE) { 
                response.setRc("400");
                response.setRd("Gagal update attachment");
                response.setData("File size exceeds the maximum allowed size of 3MB.");
                return new ResponseEntity<>(response, HttpStatus.PAYLOAD_TOO_LARGE);
            }

            // Create a request object
            UpdateDocumentRequest request = new UpdateDocumentRequest();
            request.setDocumentId(documentId);
            request.setAssignTo(assignTo);
            request.setUserId(userId);
            request.setTitle(title);
            request.setDescriptionAttachment(descriptionAttachment);
            request.setFile(file);
            request.setFileStatus(fileStatus);
            request.setFolderId(folderId);
            request.setFileVersion(fileVersion);
            request.setFileLocationType(fileLocationType);

            // Call the service method
            gioService.updateAttachment(request);

            response.setData("Updated attachment success!");
            response.setRc("00");
            response.setRd("Document updated successfully");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            response.setData(e.getMessage());
            response.setRc("400");
            response.setRd("Gagal update attachment");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Sample test IP endpoint (from the original controller)
    @GetMapping("/test-ip")
    public HttpEntity<MampangApiResponse> getIps() {
        MampangApiResponse response = new MampangApiResponse("data", "00", "Success");
        response.setRc("00");
        response.setRd("Success");
        response.setData("data");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
