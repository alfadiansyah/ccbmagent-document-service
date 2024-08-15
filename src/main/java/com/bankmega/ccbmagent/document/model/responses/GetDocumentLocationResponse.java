package com.bankmega.ccbmagent.document.model.responses;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GetDocumentLocationResponse {

    private String path;
    private Integer attachmentsId;
    private String name;

    public String generatePathLocation() {
        return this.path + this.attachmentsId.toString() + "_" + this.name;
    }
}
