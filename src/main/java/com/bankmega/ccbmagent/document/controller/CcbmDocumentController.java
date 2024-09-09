package com.bankmega.ccbmagent.document.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bankmega.ccbmagent.document.model.requests.GetDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.UpdateDocumentRequest;
import com.bankmega.ccbmagent.document.services.CcbmDocumentService;
import com.bankmega.ccbmagent.document.services.UpdateCcbmDocumentService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import jakarta.servlet.http.HttpServletRequest;
import mampang.validation.annotation.JsRequestBodyValidation.JsRequestBodyValidation;
import mampang.validation.dto.MampangApiResponse;

@RestController
@RequestMapping("/ccbm/document")
public class CcbmDocumentController {

    @Autowired
    private CcbmDocumentService service;

    @Autowired
    private UpdateCcbmDocumentService updateCcbmDocumentService;
    private static final Logger logger = LoggerFactory.getLogger(CcbmDocumentController.class);

    @Autowired
    private HttpServletRequest requestHeader;
    // private static final Logger logger =
    // LoggerFactory.getLogger(YourController.class);

    @PostMapping(value = "/ccbm/document/insert")
    public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
        return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
    }

    // gio
    // @PostMapping("/update")
    // public ResponseEntity<String> updateDocument(@RequestBody
    // UpdateDocumentRequest request) {
    // try {
    // updateCcbmDocumentService.updateAttachment(request);
    // return ResponseEntity.ok("Document updated successfully");
    // } catch (Exception e) {
    // return ResponseEntity.status(500).body("Failed to update document: " +
    // e.getMessage());
    // }
    // }

    @GetMapping("/test")
    public String getTest() {
        return "Test Success";
    }

    @GetMapping("/test-exception")
    public String getTestEx() throws Exception {
        throw new Exception("halo saya exception");
    }

    @PostMapping("/get")
    @JsRequestBodyValidation
    public HttpEntity<MampangApiResponse> getDocuments(@RequestBody GetDocumentRequest request) {
        // ini di komen dulu karena belum tahu fungsi usernamenya buat apa
        // if (requestHeader.getHeader("username") == null) {
        // throw new JsException("404", "Ditemukan Header Kosong => username",
        // HttpStatus.OK);
        // }
        return service.getDocument(request.getTicketId());
    }

    // Gio get data from attatchment folder
    @GetMapping("/folders-attachments")
    public HttpEntity<MampangApiResponse> getFolders() {
        // Call the service method and return its result
        return service.getFolders();
    }

    @GetMapping("/test-ip")
    public HttpEntity<MampangApiResponse> getIps() {
        MampangApiResponse response = new MampangApiResponse("data", "00", "Success");

        response.setRc("00");
        response.setRd("Success");
        response.setData("data");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

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
            if (file.getSize() > 3 * 1024 * 1024) { // 3MB in bytes
                // return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE)
                // .body("File size exceeds the maximum allowed size of 3MB.");
                // response.setData("File size exceeds the maximum allowed size of 3MB.");
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
            updateCcbmDocumentService.updateAttachment(request);
            // return ResponseEntity.ok("Document updated successfully");
            response.setData("Updated attachment success!");
            response.setRc("00");
            response.setRd("Document updated successfully");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            // Log the exception and return error response
            e.printStackTrace();
            // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
            // .body("Failed to update document: " + e.getMessage());
            response.setData(e.getMessage());
            response.setRc("400");
            response.setRd("Gagal update attachment ");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);

        }
    }

}
