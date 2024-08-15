package com.bankmega.ccbmagent.document.model.responses;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class ApiResponse {
  private String rc;
  private String rd;
  private Object data;
}
