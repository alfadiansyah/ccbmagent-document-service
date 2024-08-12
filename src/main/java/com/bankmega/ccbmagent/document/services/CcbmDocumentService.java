package com.bankmega.ccbmagent.document.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.CcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;

@Service
public class CcbmDocumentService {

	@Autowired
	private CcbmDocumentMapper mapper;

	public Object insertingDocument(InsertDocumentRequest request) {
		String fileName = request.getFile().getOriginalFilename().replaceAll(" ", "_");
		String fileType = request.getFile().getContentType();
		long fileSize = request.getFile().getSize();
		
		return null;
	}
	
	
}
