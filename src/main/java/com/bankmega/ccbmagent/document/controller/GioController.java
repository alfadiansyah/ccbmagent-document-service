package com.bankmega.ccbmagent.document.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    // gett folder
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

    @PostMapping("/update")
public HttpEntity<MampangApiResponse> updateDocument(
        @RequestParam("documentId") long documentId,
        @RequestParam("assignTo") String assignTo,
        @RequestParam("userId") String userId,
        @RequestParam("title") String title,
        @RequestParam("descriptionAttachment") String descriptionAttachment,
        @RequestParam(required = false, value = "file") MultipartFile file,  // File menjadi opsional
        @RequestParam("fileStatus") Boolean fileStatus,
        @RequestParam("folderId") String folderId,
        @RequestParam("fileVersion") String fileVersion,
        @RequestParam("fileLocationType") String fileLocationType) {

    MampangApiResponse response = new MampangApiResponse("data", "00", "Success");

    try {
        // Validate file size if file is present
        if (file != null && file.getSize() > MAX_FILE_SIZE) {
            response.setRc("400");
            response.setRd("Gagal update attachment");
            response.setData("File size exceeds the maximum allowed size of 3MB.");
            return new ResponseEntity<>(response, HttpStatus.PAYLOAD_TOO_LARGE);
        }

        // Create request object
        UpdateDocumentRequest request = new UpdateDocumentRequest();
        request.setDocumentId(documentId);
        request.setAssignTo(assignTo);
        request.setUserId(userId);
        request.setTitle(title);
        request.setDescriptionAttachment(descriptionAttachment);
        request.setFile(file);  // Assign file, even if it's null
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

      @PostMapping("/getTickets")
    public ResponseEntity<MampangApiResponse> getTickets(@RequestBody Map<String, Integer> requestBody) {
        int userId = requestBody.get("userId");
        try {
            // Call the service to get the tickets
            MampangApiResponse response = gioService.getTicketsByUserId(userId);

            // Return response with appropriate HTTP status
            if ("00".equals(response.getRc())) {
                return new ResponseEntity<>(response, HttpStatus.OK); // Success
            } else {
                return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR); // Error
            }

        } catch (Exception e) {
            // Handle unexpected error
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error processing request");
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR); // Internal Server Error
        }
    }
   
    @PostMapping("/searchTickets")
    public ResponseEntity<MampangApiResponse> searchTickets(@RequestBody Map<String, Object> requestBody) {
        int userId = (int) requestBody.get("userId");
        String searchBy = (String) requestBody.get("searchBy");
        String keyword = (String) requestBody.get("keyword");

        try {
            // Call service method to fetch search results
            MampangApiResponse response = gioService.searchTickets(userId, searchBy, keyword);

            // Return appropriate response based on the search result
            if ("00".equals(response.getRc())) {
                return new ResponseEntity<>(response, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error processing request");
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
