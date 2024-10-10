package com.bankmega.ccbmagent.document.model.responses;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointAuthResponse {
   
    private String historyPoint;
    private Object queryProfile;
    private Object queryHistoryPoint;
}
