package com.bankmega.ccbmagent.document.model.responses;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GetDocumentResponse {
  private String userName;
  private String activityType;
  private MultipartFile fileType;
  private String path;
  private Date lastModified;
  private Date modifiedTime;
  private String attachmentSid;
  private String crmId;
  private String description;
  private String notesId;
  private String note_no;
  private String title;
  private String fileName;
  private String noteContent;
  private Integer folderId;
  private String fileLocationType;
  private Integer fileDownloadCount;
  private Integer fileStatus;
  private Integer fileSize;
  private String fileversion;
}
