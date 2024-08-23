//package com.bankmega.ccbmagent.document.util;
//
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//
//import mampang.validation.MampangExceptionHandler;
//import mampang.validation.dto.MampangApiResponse;
//
//@ControllerAdvice
//public class CcbmExceptionHandler extends MampangExceptionHandler {
//
//    @Override
//    @ExceptionHandler(Exception.class)
//    public ResponseEntity<MampangApiResponse> handleException(Exception e) {
//        return ResponseEntity
//                .status(HttpStatus.BAD_REQUEST)
//                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
//                .body(new MampangApiResponse(null, "404", "EXCEPTION MESSAGE: " + e.getMessage()));
//    }
//}
