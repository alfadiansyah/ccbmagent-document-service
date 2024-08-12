package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.services.CcbmDocumentService;

@RestController
@RequestMapping
public class CcbmDocumentController {
	
	@Autowired
	private CcbmDocumentService service;
	
	@PostMapping(value = "/ccbm/document/insert")
	public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
		return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
	}

}
