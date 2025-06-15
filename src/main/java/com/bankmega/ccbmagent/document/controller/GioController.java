package com.bankmega.ccbmagent.document.controller;

import java.util.Arrays;
import java.util.List;
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
    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024;  

    private final GioService gioService;

    @Autowired
    public GioController(GioService gioService) {
        this.gioService = gioService;
    }

    @GetMapping("/folders-attachments")
    public HttpEntity<MampangApiResponse> getFolders() {
        return gioService.getFolders();
    }

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
        @RequestParam(required = false, value = "file") MultipartFile file, 
        @RequestParam("fileStatus") Boolean fileStatus,
        @RequestParam("folderId") String folderId,
        @RequestParam("fileVersion") String fileVersion,
        @RequestParam("fileLocationType") String fileLocationType) {

    MampangApiResponse response = new MampangApiResponse("data", "00", "Success");

    List<String> allowedExtensions = Arrays.asList(
        "tif", "odt", "zip", "wps", "txt", "jpg", "jpeg", "png", 
        "pdf", "rar", "doc", "docx", "xls", "xlsx"
    );

    try {
        if (file != null) {
        System.out.println("++++++++"+file.getSize());
        System.out.println("Uploaded file name: " + file.getOriginalFilename());
        System.out.println("Extracted file extension: " + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1).toLowerCase());         
       
            if (file.getSize() > MAX_FILE_SIZE) {
                response.setRc("400");
                response.setRd("Gagal update attachment");
                response.setData("File size exceeds the maximum allowed size of 3MB.");
                return new ResponseEntity<>(response, HttpStatus.PAYLOAD_TOO_LARGE);
            }
            System.out.println("=========="+file);

           
            String fileName = file.getOriginalFilename();
            String fileExtension = fileName != null ? fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase() : "";

            if (!allowedExtensions.contains(fileExtension)) {
                response.setRc("400");
                response.setRd("Invalid file type!");
                response.setData("Not Allowed extensions ");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }
            System.out.println("<>><><<><><><><<>>><><<>");
            

        }

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


    @GetMapping("/test-ip")
    public HttpEntity<MampangApiResponse> getIps() {
        MampangApiResponse response = new MampangApiResponse("data", "00", "Success");
        response.setRc("00");
        response.setRd("Success");
        response.setData("data");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/getTickets")
    public ResponseEntity<MampangApiResponse> getTickets(@RequestBody Map<String, Object> requestBody) {
        int userId = (int) requestBody.get("userId");
        int page = requestBody.get("page") != null ? (int) requestBody.get("page") : 1;

        try {
            MampangApiResponse response = gioService.getTicketsByUserId(userId, page);

            return "00".equals(response.getRc()) 
                ? new ResponseEntity<>(response, HttpStatus.OK)
                : new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);

        } catch (Exception e) {
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error processing request");
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/searchTickets")
    public ResponseEntity<MampangApiResponse> searchTickets(@RequestBody Map<String, Object> requestBody) {
        int userId = (int) requestBody.get("userId");
        String searchBy = (String) requestBody.get("searchBy");
        String keyword = (String) requestBody.get("keyword");
        int page = requestBody.get("page") != null ? (int) requestBody.get("page") : 1;
    
        try {
            MampangApiResponse response = gioService.searchTickets(userId, searchBy, keyword, page);
    
            return "00".equals(response.getRc())
                ? new ResponseEntity<>(response, HttpStatus.OK)
                : new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    
        } catch (Exception e) {
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error processing request");
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
}
