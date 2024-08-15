package com.bankmega.ccbmagent.document.services;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.CcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.DataCurrent;

import mampang.validation.component.JsResponseGenerator;
import mampang.validation.dto.MampangApiResponse;

@Service
public class CcbmDocumentService {

    @Autowired
    private CcbmDocumentMapper mapper;

    @Autowired
    private JsResponseGenerator jsr;

    public Object insertingDocument(InsertDocumentRequest request) {
    	String fileName = "";
    	String fileType = "";
    	String path = "";
    	String lastId = "";
    	String userId = "";
    	String assignTo = "";
     	String userLogin = "";
    	
    	long fileSize = 0;

    	try {
    		
    		// step 2: defining file name, file size, file type, path
    		fileName = request.getFile().getOriginalFilename();
    		fileType = request.getFile().getContentType();
    		fileSize = request.getFile().getSize();
    		path = LocalDateTime.now().toString(); // formatting date is needed
    		
    		// step 3: updating id sequence and set to temp variable {lastId}
    		mapper.updateLastId();
    		
    		lastId = mapper.ambilDataLastId();
    		
    		// step 4: inseting data request to crmentity
    		userId = request.getUserId();
    		assignTo = request.getAssignTo();
    		
    		mapper.insertingData(lastId, userId, assignTo, userLogin, LocalDateTime.now().toString(), LocalDateTime.now().toString());
    		
    		// step 5: update table modentity with lock table traffic
    		DataCurrent data = mapper.lockAndSelectCurrentId();
    		
    		String pastId = data.getCurrentId();
    		Integer futureId = Integer.parseInt(pastId) + 1;
    		
    		mapper.updateAndUnlockModentity(pastId, futureId.toString());
    		
    		// step 6: insert and update document into tb notes and senotesrel
    		
		} catch (Exception e) {
			// TODO: handle exception
		}
    	

        return null;
    }

    public HttpEntity<MampangApiResponse> getDocument(String ticketId) {
        Object result = mapper.getListDocument(ticketId);
        return jsr.ok(result, "00", "Sukses Mendapatkan List Document");
    }

}
