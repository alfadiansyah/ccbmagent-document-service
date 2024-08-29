package com.bankmega.ccbmagent.document.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.components.FileComponent;
import com.bankmega.ccbmagent.document.components.ResponseGenerator;
import com.bankmega.ccbmagent.document.mappers.JohnSungMapper;
import com.bankmega.ccbmagent.document.model.requests.DownloadDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;
import com.bankmega.ccbmagent.document.model.responses.CheckIsDocumentDeletedResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentDownloadCountResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentLocationResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;

import mampang.validation.exception.JsException;

@Service
public class JohnSungService {
	
	@Autowired
	private JohnSungMapper mapper;
	
	@Autowired
	private ResponseGenerator response;
	
	@Autowired
	private FileComponent file;
	
	public ResponseEntity<ApiResponse> getDocument(String ticketId) {
        List<GetDocumentResponse> result = mapper.getListDocument(ticketId);

        if (result == null || result.size() < 1) {
            throw new JsException("404", "NOT FOUND", HttpStatus.BAD_REQUEST);
        }

        return response.success(result, "00", "Sukses Mendapatkan List Document");
    }

    public ResponseEntity<InputStreamResource> downloadDocument(DownloadDocumentRequest request) {
        CheckIsDocumentDeletedResponse isDeleted = mapper.checkIsDocumentDeleted(request.getDocumentId());

        System.out.println("CHECK DOCUMENT DELETED STATUS: " + isDeleted);

        if (isDeleted.equals(1)) {
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
