package com.bankmega.ccbmagent.document.model.requests;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetAssigntoAttachmentDivision {
     private Long divisiId;
    private String nama;
}
