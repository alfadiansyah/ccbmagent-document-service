package com.bankmega.ccbmagent.document.model.requests;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UpdateDocumentRequest {
	private long documentId;
	private String assignTo;
	private String userId;
	private String title;
	private String descriptionAttachment;
	private MultipartFile file;
	private Boolean fileStatus;
	private String folderId;
	private String fileVersion;
	private String fileLocationType;

	// private String userId;
}
