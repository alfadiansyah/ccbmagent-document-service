package com.bankmega.ccbmagent.document.model.requests;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketRequest {
    private String ticketNo;
    private String createdTime;
    private String cf667;
    private String cf701;
    private String priority;
    private String status;
}
