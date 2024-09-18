package com.bankmega.ccbmagent.document.model.responses;

import java.util.List;

import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetAssigntoAttachmentResponse {
    private List<?> userData;  // Can hold either BankMegaRequest or SyariahBankMegaRequest
    private List<GetAssigntoAttachmentDivision> divisiData;
}
