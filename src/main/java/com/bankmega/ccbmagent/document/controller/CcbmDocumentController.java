package com.bankmega.ccbmagent.document.controller;

import java.sql.SQLSyntaxErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.services.CcbmDocumentService;

import mampang.validation.component.JsResponseGenerator;
import mampang.validation.dto.MampangApiResponse;

@RestController
@RequestMapping("/ccbm/document")
public class CcbmDocumentController {

    @Autowired
    private CcbmDocumentService service;

    @Autowired
    private JsResponseGenerator jsr;

    // @PostMapping(value = "/ccbm/document/insert")
    // public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
    // 	return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
    // }
    @GetMapping("/test")
    public String getTest() {
        return "Test Success";
    }

    @GetMapping("/test-exception")
    public HttpEntity<MampangApiResponse> getException() throws Throwable {
        // throw new JsException("404", "error", HttpStatus.BAD_REQUEST);
        throw new SQLSyntaxErrorException("test");
    }

    @PostMapping("/get")
    public HttpEntity<MampangApiResponse> getDocuments() {
        try {
            return service.getDocument();
        } catch (Exception e) {
            return jsr.internalServerError("404", "Error: " + e.getMessage());
        }
    }

}
