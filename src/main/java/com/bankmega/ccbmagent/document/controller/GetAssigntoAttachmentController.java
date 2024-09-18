package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bankmega.ccbmagent.document.model.responses.GetAssigntoAttachmentResponse;
import com.bankmega.ccbmagent.document.services.GetAssigntoAttachmentService;

@RestController
@RequestMapping("/ccbm/document/attachment")
public class GetAssigntoAttachmentController {
    private final GetAssigntoAttachmentService getAssigntoAttachmentService;

    @Autowired
    public GetAssigntoAttachmentController(GetAssigntoAttachmentService getAssigntoAttachmentService) {
        this.getAssigntoAttachmentService = getAssigntoAttachmentService;
    }

    @GetMapping("/data")
    public ResponseEntity<GetAssigntoAttachmentResponse> getAssignmentData(
            @RequestParam("channel") String channel) {
        try {
            GetAssigntoAttachmentResponse response = getAssigntoAttachmentService.getCombinedUserAndDivisionData(channel);
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}
