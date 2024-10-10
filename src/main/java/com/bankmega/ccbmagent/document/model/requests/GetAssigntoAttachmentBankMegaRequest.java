package com.bankmega.ccbmagent.document.model.requests;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetAssigntoAttachmentBankMegaRequest {
    private Long id;
    private String userName;
    private String firstName;
    private String lastName;
}
