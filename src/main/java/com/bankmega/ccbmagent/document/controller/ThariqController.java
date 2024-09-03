package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.services.ThariqService;

import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;

@RestController
@RequestMapping("/ccbm/document")
public class ThariqController {
	

	@Autowired
	private ThariqService service;

	@PostMapping(value = "/insert")
	public ResponseEntity<?> insertDocument(@ModelAttribute InsertDocumentRequest request) {
		return ResponseEntity.status(HttpStatus.OK).body(service.insertingDocument(request));
	}

	@PostMapping(value = "/file/test")
	public ResponseEntity<?> saveFile(@ModelAttribute InsertDocumentRequest request) {
		Object response = null;
		
		try {
			response = service.testCreate(request);
		} catch (Exception e) { 
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiResponse("400", "BAD REQUEST", false));
		}
		return ResponseEntity.status(HttpStatus.OK).body(response);
	}

}
