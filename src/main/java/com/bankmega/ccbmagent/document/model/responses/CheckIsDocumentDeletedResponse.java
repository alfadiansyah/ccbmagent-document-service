package com.bankmega.ccbmagent.document.model.responses;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckIsDocumentDeletedResponse {
  private Integer deleted;
}
