package com.bankmega.ccbmagent.document.model.requests;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertDocumentRequest {

	private String ticketId;
	private String assignTo;
	private String title;
	private String descriptionAttachment;
	private MultipartFile file;
	private Boolean fileStatus;
	private String folderId;

}
