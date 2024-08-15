package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.model.requests.DownloadDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.GetDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;
import com.bankmega.ccbmagent.document.services.CcbmDocumentService;

import mampang.validation.annotation.JsRequestBodyValidation.JsRequestBodyValidation;
import mampang.validation.exception.JsException;

@RestController
@RequestMapping("/ccbm/document")
public class CcbmDocumentController {

    @Autowired
    private CcbmDocumentService service;

    // @Autowired
    // private HttpServletRequest requestHeader;
    // @PostMapping(value = "/ccbm/document/insert")
    // public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
    // 	return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
    // }
    @GetMapping("/test")
    public String getTest() {
        return "Test Success";
    }

    @GetMapping("/test-exception")
    public String getTestEx() {
        // throw new Exception("halo saya exception");
        throw new JsException("999", "halo saya exception", HttpStatus.OK);

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
    public ResponseEntity<ApiResponse> downloadDocument(@RequestBody DownloadDocumentRequest request) throws Throwable {
        System.out.println("DOCUMENT ID: " + request.getDocumentId());
        return service.downloadDocument(request);
    }

}
