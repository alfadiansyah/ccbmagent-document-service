package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.model.requests.GetDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.services.CcbmDocumentService;

import jakarta.servlet.http.HttpServletRequest;
import mampang.validation.annotation.JsRequestBodyValidation.JsRequestBodyValidation;
import mampang.validation.dto.MampangApiResponse;

@RestController
@RequestMapping("/ccbm/document")
public class CcbmDocumentController {

    @Autowired
    private CcbmDocumentService service;

    @Autowired
    private HttpServletRequest requestHeader;
    // private static final Logger logger = LoggerFactory.getLogger(YourController.class);


    @PostMapping(value = "/ccbm/document/insert")
    public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
        return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
    }

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
}
