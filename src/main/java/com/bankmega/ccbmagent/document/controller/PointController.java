package com.bankmega.ccbmagent.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.MediaType;

import com.bankmega.ccbmagent.document.model.requests.PointAuthRequest;
import com.bankmega.ccbmagent.document.model.responses.PointAuthResponse;
import com.bankmega.ccbmagent.document.services.PointService;
@RestController
@RequestMapping("/user/point-service")
public class PointController {

    @Autowired
    private PointService pointService;

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<PointAuthResponse> processPointService(@RequestBody PointAuthRequest request) throws Exception {
        PointAuthResponse response = pointService.processPointService(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping(value = "/history", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<PointAuthResponse> getHistoryPoints(@RequestBody PointAuthRequest request) throws Exception {
        PointAuthResponse response = pointService.getHistoryPoints(request.getAccessToken(), request.getPhoneNo(), request.getCurrentPage());
        return ResponseEntity.ok(response);
    }
}
