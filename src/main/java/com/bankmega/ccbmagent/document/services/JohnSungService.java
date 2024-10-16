package com.bankmega.ccbmagent.document.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.components.FileComponent;
import com.bankmega.ccbmagent.document.components.ResponseGenerator;
import com.bankmega.ccbmagent.document.components.StringComponent;
import com.bankmega.ccbmagent.document.components.TimeComponent;
import com.bankmega.ccbmagent.document.mappers.JohnSungMapper;
import com.bankmega.ccbmagent.document.model.requests.DeleteDocumentRequest;
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
	
	@Autowired
	private TimeComponent time;
	
	@Autowired
	private StringComponent stringComponent;
	
    public ResponseEntity<ApiResponse> getDocument(String ticketId) {
        List<GetDocumentResponse> result = mapper.getListDocument(ticketId);

        if (result == null || result.size() < 1) {
            throw new JsException("404", "NOT FOUND", HttpStatus.NOT_FOUND);
        }

        return response.success(result, "00", "Sukses Mendapatkan List Document");
    }

    public ResponseEntity<InputStreamResource> downloadDocument(DownloadDocumentRequest request) throws Exception {

        //MEMASTIKAN STATUS DOKUMEN BELUM TERDELETE
        CheckIsDocumentDeletedResponse documentDeletedResponse = mapper.checkIsDocumentDeleted(request.getDocumentId());

        System.out.println("CHECK DOCUMENT DELETED STATUS: " + documentDeletedResponse);

        if (documentDeletedResponse.getDeleted().equals(1)) {
            throw new JsException("404", "Dokumen Sudah Dihapus", HttpStatus.NO_CONTENT);
        }

        //MENDAPATKAN LOKASI DOKUMEN
        GetDocumentLocationResponse documentLocation = mapper.getDocumentLocation(request.getDocumentAttachmentId());

        System.out.println("DOCUMENT LOCATION: " + documentLocation);

        if (documentLocation == null) {
            throw new JsException("404", "Tidak ada dokumen dengan ID: " + request.getDocumentId(), HttpStatus.OK);
        }

        System.out.println("SUKSES MENDAPATKAN LOKASI, MENCOBA DOWNLOAD DOKUMEN");

        //MENDAPATKAN DOWNLOAD COUNT UNTUK DI UPDATE
        GetDocumentDownloadCountResponse downloadCount = mapper.getDocumentDownloadCount(request.getDocumentId());

        System.out.println("DOWNLOAD COUNT: " + downloadCount);

        //UPDATE DOWNLOAD COUNT
        Integer updatedFileDownloadCount = downloadCount.getFileDownloadCount() + 1;
        mapper.updateDocumentDownloadStatus(request.getDocumentId(), updatedFileDownloadCount);

        System.out.println("SUKSES UPDATE DOWNLOAD STATUS");

        System.out.println("MENCOBA DOWNLOAD FILE");

        String generatedDocumentLocation = documentLocation.generatePathLocation();

        //RETURN FILE
        return file.downloadFrom(generatedDocumentLocation);
    }

    public ResponseEntity<ApiResponse> deleteDocument(DeleteDocumentRequest request) {

        //CEK KETERSEDIAAN DATA
        Integer isDocumentAvailable = mapper.findDocumentByDocumentIdAndTicketId(request.getDocumentId(), request.getTicketId());
        System.out.println("ISDOCUMENTAVAILABLE: " + isDocumentAvailable);
        if (isDocumentAvailable == null || isDocumentAvailable.equals(0)) {
            throw new JsException("404", "NOT FOUND", HttpStatus.NOT_FOUND);
        }

        //DELETE DOKUMEN
        mapper.deleteDocumentByDocumentIdAndTicketId(request.getDocumentId(), request.getTicketId());

        //UPDATE STATUS DOKUMEN
        /**
         * UPDATE STATUS DOKUMEN
         * 
         * SEBELUM ITU TIMESTAMP DI 
         */
        mapper.updateDocumentStatus(time.getTimeStamp24HourFormat(), request.getUserId(), request.getTicketId());

        //GET LOG SEBELUMNYA
        String previousLog = mapper.getDocumentLogPreviousLogByTicketId(request.getTicketId());
        if (previousLog == null) {
            System.out.println("TIDAK DAPAT DITEMUKAN LOG SEBELUMNYA UNTUK TICKETID: " + request.getTicketId());
            previousLog = "";
        }

        //Get Document File Name
        String documentFileName = mapper.getDocumentFileNameByDocumentId(request.getDocumentId());
        if (documentFileName == null) {
            System.out.println("TIDAK ADA DOKUMEN DENGAN DOCUMENTID: " + request.getDocumentId());
            documentFileName = "DOCUMENT NOT FOUND";
        }

        //GET USERNAME
        String userName = mapper.getUserNameByUserId(request.getUserId());
        if (userName == null) {
            System.out.println("TIDAK ADA USERNAME DENGAN userID: " + request.getUserId());
            userName = "USERNAME NOT FOUND";
        }

        //SET LOG DENGAN FORMAT: [[isi log sebelumnya] + [Document namafile] was deleted [hari tanggal bulan tahun time AM/PM] by [userName]]
        String newLog = stringComponent.joinStringWithSpace(new String[]{previousLog, "Document", documentFileName, "was deleted", time.getTimeStamp12HourFormat(), "by", userName});
        newLog = newLog + "--//--";

        System.out.println("LOG UNTUK DI POSTING: " + newLog);

        // INSERT NEW LOG TO DB
        mapper.setDocumentUpdateLog(newLog, request.getTicketId());

        System.out.println("SUKSES MENGHAPUS DOKUMEN DENGAN ID: " + request.getDocumentId() + " DAN TICKETID: " + request.getTicketId());
        return response.success(null, "00", "Sukses Menghapus Dokumen");
    }

}
