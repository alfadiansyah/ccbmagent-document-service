package com.bankmega.ccbmagent.document.services;

import java.util.List;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.components.FileComponent;
import com.bankmega.ccbmagent.document.components.ResponseGenerator;
import com.bankmega.ccbmagent.document.mappers.CcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.DownloadDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;
import com.bankmega.ccbmagent.document.model.responses.CheckIsDocumentDeletedResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentDownloadCountResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentLocationResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.DataCurrent;

import mampang.validation.exception.JsException;

@Service
public class CcbmDocumentService {

    @Autowired
    private CcbmDocumentMapper mapper;

    @Autowired
    private ResponseGenerator response;

    @Autowired
    private FileComponent file;
  
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
    	
    public ResponseEntity<ApiResponse> getDocument(String ticketId) {
        List<GetDocumentResponse> result = mapper.getListDocument(ticketId);

        if (result == null || result.size() < 1) {
            throw new JsException("404", "NOT FOUND", HttpStatus.NOT_FOUND);
        }

        return response.success(result, "00", "Sukses Mendapatkan List Document");
    }

    public ResponseEntity<InputStreamResource> downloadDocument(DownloadDocumentRequest request) {
        CheckIsDocumentDeletedResponse documentDeletedResponse = mapper.checkIsDocumentDeleted(request.getDocumentId());

        System.out.println("CHECK DOCUMENT DELETED STATUS: " + documentDeletedResponse);

        if (documentDeletedResponse.getDeleted().equals(1)) {
            throw new JsException("404", "Dokumen Sudah Dihapus", HttpStatus.NO_CONTENT);
        }

        GetDocumentLocationResponse documentLocation = mapper.getDocumentLocation(request.getDocumentAttachmentId());

        System.out.println("DOCUMENT LOCATION: " + documentLocation);

        if (documentLocation == null) {
            throw new JsException("404", "Tidak ada dokumen dengan ID: " + request.getDocumentId(), HttpStatus.OK);
        }

        System.out.println("SUKSES MENDAPATKAN LOKASI, MENCOBA DOWNLOAD DOKUMEN");

        GetDocumentDownloadCountResponse downloadCount = mapper.getDocumentDownloadCount(request.getDocumentId());

        System.out.println("DOWNLOAD COUNT: " + downloadCount);

        if (downloadCount == null || downloadCount.getFileDownloadCount() == null) {
            throw new JsException("404", "File Tidak Terdaftar di tabel download, Tidak ada dokumen dengan ID: " + request.getDocumentId(), HttpStatus.OK);
        }

        Integer updatedFileDownloadCount = downloadCount.getFileDownloadCount() + 1;
        mapper.updateDocumentDownloadStatus(request.getDocumentId(), updatedFileDownloadCount);

        System.out.println("SUKSES UPDATE DOWNLOAD STATUS");

        System.out.println("MENCOBA DOWNLOAD FILE");

        String generatedDocumentLocation = documentLocation.generatePathLocation();
        return file.downloadFrom(generatedDocumentLocation);
    }

}
