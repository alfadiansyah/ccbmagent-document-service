package com.bankmega.ccbmagent.document.services;

import java.time.LocalDateTime;
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
import com.bankmega.ccbmagent.document.mappers.CcbmDocumentMapper;
import com.bankmega.ccbmagent.document.model.requests.DeleteDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.DownloadDocumentRequest;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;
import com.bankmega.ccbmagent.document.model.responses.CheckIsDocumentDeletedResponse;
import com.bankmega.ccbmagent.document.model.responses.DataCurrent;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentDownloadCountResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentLocationResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;

import mampang.validation.exception.JsException;

@Service
public class CcbmDocumentService {

    @Autowired
    private CcbmDocumentMapper mapper;

    @Autowired
    private ResponseGenerator response;

    @Autowired
    private FileComponent file;

    @Autowired
    private TimeComponent time;

    @Autowired
    private StringComponent stringComponent;

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

        if (downloadCount == null || downloadCount.getFileDownloadCount() == null) {
            throw new JsException("404", "File Tidak Terdaftar di tabel download, Tidak ada dokumen dengan ID: " + request.getDocumentId(), HttpStatus.OK);
        }

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
        mapper.updateDocumentStatus(time.getTimeStamp(), request.getUserId(), request.getTicketId());

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
        String newLog = stringComponent.joinStringWithSpace(new String[]{previousLog, "Document", documentFileName, "was deleted", time.getTimeStamp(), "by", userName});
        newLog = newLog + "--//--";

        System.out.println("LOG UNTUK DI POSTING: " + newLog);

        // INSERT NEW LOG TO DB
        mapper.setDocumentUpdateLog(newLog, request.getTicketId());

        System.out.println("SUKSES MENGHAPUS DOKUMEN DENGAN ID: " + request.getDocumentId() + " DAN TICKETID: " + request.getTicketId());
        return response.success(null, "00", "Sukses Menghapus Dokumen");
    }

}
