package com.bankmega.ccbmagent.document.services;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
// import java.util.logging.Logger;

// import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.CcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.DataCurrent;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;
import com.bankmega.ccbmagent.document.model.responses.GetFolderResponse;

import mampang.validation.component.JsResponseGenerator;
import mampang.validation.dto.MampangApiResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class CcbmDocumentService {

    @Autowired
    private CcbmDocumentMapper mapper;

    @Autowired
    private JsResponseGenerator jsr;

	private static final Logger logger = LoggerFactory.getLogger(CcbmDocumentService.class);



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

	 public HttpEntity<MampangApiResponse> getFolders() {
        try {
            // Retrieve the list of folders from the mapper
            List<GetFolderResponse> folders = mapper.getFolders();
            logger.debug("Retrieved folders: {}", folders);
			
            // Create a response object
            MampangApiResponse response = new MampangApiResponse(folders, "00", "Success");
            response.setRc("00");
            response.setRd("Success");
            response.setData(folders);
            
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            // Handle error and create an error response object
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error retrieving folders");
			logger.error("Error retrieving folders", e);


			errorResponse.setRc("01");
            errorResponse.setRd("Error retrieving folders");
            errorResponse.setData(e.getMessage());
            
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
