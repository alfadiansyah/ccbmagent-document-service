package com.bankmega.ccbmagent.document.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.model.requests.DeleteDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.DownloadDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.GetDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;
import com.bankmega.ccbmagent.document.services.CcbmDocumentService;

import jakarta.servlet.http.HttpServletRequest;
import mampang.validation.annotation.JsRequestBodyValidation.JsRequestBodyValidation;
import mampang.validation.exception.JsException;

@RestController
@RequestMapping("/ccbm/document")
public class CcbmDocumentController {

    @Autowired
    private CcbmDocumentService service;

    @Autowired
    private HttpServletRequest requestHeader;

    @PostMapping(value = "/ccbm/document/insert")
    public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
        return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
    }

    @GetMapping("/test")
    public String getTest() {
        return "Test Success";
    }

    @GetMapping("/test-exception")
    public String getTestEx() {
        // throw new Exception("halo saya exception");
        throw new JsException("999", "halo saya exception", HttpStatus.BAD_REQUEST);

    }

    @PostMapping("/get")
    @JsRequestBodyValidation
    public ResponseEntity<ApiResponse> getDocuments(@RequestBody GetDocumentRequest request) {
        // ini di komen dulu karena belum tahu fungsi usernamenya buat apa
        // if (requestHeader.getHeader("username") == null) {
        //     throw new JsException("404", "Ditemukan Header Kosong => username", HttpStatus.OK);
        // }
        System.out.println("TICKET ID: " + request.getTicketId());
        return service.getDocument(request.getTicketId());
    }

    @PostMapping("/download")
    @JsRequestBodyValidation
    public ResponseEntity<InputStreamResource> downloadDocument(@RequestBody DownloadDocumentRequest request) throws Throwable {
        System.out.println("DOCUMENT ID: " + request.getDocumentId());
        return service.downloadDocument(request);
    }

    @GetMapping("/test-download-document")
    public ResponseEntity<InputStreamResource> getFile(@RequestParam String fileLocation) {
        Path path = Paths.get(fileLocation);
        File file = path.toFile();
        try {
            InputStreamResource resource = new InputStreamResource(Files.newInputStream(path));

            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + file.getName());
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE);

            System.out.println("FILENAME: " + file.getName());

            return ResponseEntity.ok()
                    .headers(headers)
                    .contentLength(file.length())
                    .body(resource);

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return ResponseEntity.internalServerError().build();
    }

    @PostMapping("/delete")
    @JsRequestBodyValidation
    public ResponseEntity<ApiResponse> deleteDocument(@RequestBody DeleteDocumentRequest request) {
        return service.deleteDocument(request);
    }

}
