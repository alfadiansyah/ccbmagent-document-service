package com.bankmega.ccbmagent.document.components;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.bankmega.ccbmagent.document.model.responses.ApiResponse;

import mampang.validation.component.JsResponseGenerator;

@Component
public class ResponseGenerator extends JsResponseGenerator {

    public ResponseEntity<ApiResponse> success(Object data, String rc, String rd) {

        return ResponseEntity
                .status(HttpStatus.OK)
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .body(new ApiResponse(rc, rd, data));
    }

    public ResponseEntity<ApiResponse> badRequest(Object data, String rc, String rd) {

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .body(new ApiResponse(rc, rd, data));
    }

    public ResponseEntity<ApiResponse> internalError(Object data, String rc, String rd) {

        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .body(new ApiResponse(rc, rd, data));
    }

}
