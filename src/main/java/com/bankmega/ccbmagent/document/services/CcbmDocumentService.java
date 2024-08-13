package com.bankmega.ccbmagent.document.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.CcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;

import mampang.validation.component.JsResponseGenerator;
import mampang.validation.dto.MampangApiResponse;

@Service
public class CcbmDocumentService {

    @Autowired
    private CcbmDocumentMapper mapper;

    @Autowired
    private JsResponseGenerator jsr;

    public Object insertingDocument(InsertDocumentRequest request) {
        String fileName = request.getFile().getOriginalFilename().replaceAll(" ", "_");
        String fileType = request.getFile().getContentType();
        long fileSize = request.getFile().getSize();

        return null;
    }

    public HttpEntity<MampangApiResponse> getDocument() {
        Object result = mapper.getListDocument("1466734");
        return jsr.ok(result, "00", "Sukses Mendapatkan List Document");
    }

}
