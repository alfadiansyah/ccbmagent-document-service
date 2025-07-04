package com.bankmega.ccbmagent.document.model.responses;

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
  private String fileType;
  private String path;
  private String lastModified;
  private String modifiedTime;
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
  private String folderName;
}
