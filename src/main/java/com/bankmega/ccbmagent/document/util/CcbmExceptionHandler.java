package com.bankmega.ccbmagent.document.util;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.bankmega.ccbmagent.document.model.responses.ApiResponse;

import lombok.extern.slf4j.Slf4j;
import mampang.validation.exception.JsException;

@ControllerAdvice
@Slf4j
public class CcbmExceptionHandler {

    @ExceptionHandler(JsException.class)
    public ResponseEntity<ApiResponse> handleJsExceptionCcbm(JsException e) {

        log.info("CUSTOM EXCEPTION MESSAGE: "+e.getMessage());

        return ResponseEntity
                .status(e.getHttpStatus())
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .body(new ApiResponse(e.getRc(), e.getRd(), null));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse> handleExceptionCcbm(Exception e) {
        log.info("UNHANDLED EXCEPTION: " + e.getMessage());
        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .body(new ApiResponse("404", "NOT FOUND", null));
    }
}
