package com.bankmega.ccbmagent.document.model.responses;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GetDocumentDownloadCountResponse {
  private Integer fileDownloadCount;
}
