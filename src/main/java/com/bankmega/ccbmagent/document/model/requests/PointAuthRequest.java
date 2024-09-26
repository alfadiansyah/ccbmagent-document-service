package com.bankmega.ccbmagent.document.model.requests;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointAuthRequest {
    private String phoneNo;
    private String action;
    private String accessToken;
    private Integer currentPage;  // This will be used for pagination requests
}
