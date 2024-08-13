package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.services.CcbmDocumentService;

import jakarta.servlet.http.HttpServletRequest;
import mampang.validation.component.JsResponseGenerator;
import mampang.validation.dto.MampangApiResponse;
import mampang.validation.exception.JsException;

@RestController
@RequestMapping("/ccbm/document")
public class CcbmDocumentController {

    @Autowired
    private CcbmDocumentService service;

    @Autowired
    private JsResponseGenerator jsr;

    @Autowired
    private HttpServletRequest requestHeader;

    // @PostMapping(value = "/ccbm/document/insert")
    // public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
    // 	return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
    // }
    @GetMapping("/test")
    public String getTest() {
        return "Test Success";
    }

    @GetMapping("/test-exception")
    public String getTestEx() throws Exception {
        throw new Exception("haihai");
    }

    @PostMapping("/get")
    public HttpEntity<MampangApiResponse> getDocuments() {
        if (requestHeader.getHeader("username") == null) {
            throw new JsException("404", "Ditemukan Header Kosong => username", HttpStatus.OK);
        }
        return service.getDocument();
    }

}
