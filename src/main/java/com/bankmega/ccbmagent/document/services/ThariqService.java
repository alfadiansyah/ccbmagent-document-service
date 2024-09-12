package com.bankmega.ccbmagent.document.services;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.ThariqMapper;
import com.bankmega.ccbmagent.document.model.responses.ApiResponse;
import com.bankmega.ccbmagent.document.model.requests.InsertDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.DataCurrResponse;

@Service
public class ThariqService {
	
	private final Log log = LogFactory.getLog(getClass());
	
	@Value("${directory.path-name}")
	private String path;

    @Autowired
    private ThariqMapper mapper;
  
    public Object insertingDocument(InsertDocumentRequest request) {
    	Object result = null;
    	
    	String fileName = "";
    	String fileType = "";
    	String title = "";
    	String description = "";
    	String folderId = "";
    	Integer ticketId = 0;
    	Integer userId = 0;
    	Integer assignTo = 0;
    	Integer lastId = 0;
    	Integer lastIdSec = 0;
     	
     	Boolean status = false;
    	
    	long fileSize = 0;

    	try {
    		while (result == null) {
    			if (request.getTicketId() == null || request.getTicketId().isBlank()) {
    				result = new ApiResponse("400", "Field TicketId Kosong", false);
    				break;
    			}
    			if (request.getAssignTo() == null || request.getAssignTo().isBlank()) {
    				result = new ApiResponse("400", "Field AssignTo Kosong", false);
    				break;
    			}
    			if (request.getTitle() == null || request.getTitle().isBlank()) {
    				result = new ApiResponse("400", "Field Title Kosong", false);
    				break;
    			}
    			if (request.getUserId() == null || request.getUserId().isBlank()) {
    				result = new ApiResponse("400", "Field UserId Kosong", false);
    				break;
    			}
    			if (request.getDescriptionAttachment() == null || request.getDescriptionAttachment().isBlank()) {
    				result = new ApiResponse("400", "Field DescriptionAttachment Kosong", false);
    				break;
    			}
    			if (request.getFile() == null) {
    				result = new ApiResponse("400", "Field File Kosong", false);
    				break;
    			}
    			if (request.getFile().getSize() > 3000000) {
    				result = new ApiResponse("400", "Ukuran File Lebih Dari 3MB", false);
    				break;
    			}
    			if (request.getFileStatus() == null) {
    				result = new ApiResponse("400", "Field FolderId Kosong", false);
    				break;
    			}
    			if (request.getFolderId() == null || request.getFolderId().isBlank()) {
    				result = new ApiResponse("400", "Field FolderId Kosong", false);
    				break;
    			}
    			
    			ticketId = Integer.parseInt(request.getTicketId());
        		assignTo = Integer.parseInt(request.getAssignTo());
        		title = request.getTitle();
        		userId = Integer.parseInt(request.getUserId());
        		description = request.getDescriptionAttachment();
        		folderId = request.getFolderId();
        		status = request.getFileStatus();
        		
        		// step 2: defining file name, file size, file type, path
        		fileName = request.getFile().getOriginalFilename().replaceAll(" ", "_");
        		fileType = request.getFile().getContentType();
        		fileSize = request.getFile().getSize();
        		
        		// step 3: updating id sequence and set to temp variable {lastId}
        		// 3.1 update last sequence id
        		log.info("update last id sequence");
        		mapper.updateIdSequence();
        		
        		// 3.2 select the last sequence id
        		log.info("select last id sequence");
        		lastId = mapper.selectIdSequnce();
        		
        		// step 4: inseting data request to crmentity
        		log.info("insert document to entity");
        		mapper.insertDocumentToCrmentity(lastId, userId, assignTo);
        		
        		
        		// step 5: update table modentity
        		// 5.1 lock table modentity and select cur_id and prefix
        		log.info("lock table and select");
        		mapper.lockTable("vtiger_modentity_num");
        		DataCurrResponse data = mapper.selectCurrentId();
        		
        		String pastCurId = data.getCurrentId();
        		Integer futureCurId = Integer.parseInt(pastCurId) + 1;
        		
        		// 5.2 update cur_id and unlock tables
        		log.info("update cur id and unlock table");
        		mapper.updateCurrentId(pastCurId, futureCurId.toString());
        		mapper.unlockTable();
        		
        		// step 6: insert and update document into tb notes and senotesrel
        		// 6.1 insert document to notes
        		log.info("insert document to notes");
        		mapper.insertDocumentToNotes(lastId, title, description, status, folderId, "DOC" + pastCurId);
        		
        		// 6.2 insert document notes to notesrel
        		mapper.insertDocumentNotes(ticketId, lastId);
        		log.info("insert document notes");
        		
        		// 6.3 update document details <6.1>
        		mapper.updateDocumentDetailsInNotes(fileName, (int) fileSize, fileType, lastId);
        		log.info("update document details in notes");
        		
        		// step 7: updating and select the last sequence id
        		// 7.1 update sequence id
        		mapper.updateIdSequence();
        		log.info("update sequence id");
        		
        		// 7.2 select last sequence id
        		lastIdSec = mapper.selectIdSequnce();
        		log.info("select last sequence id");
        		
        		// step 8: insert to tb crmentity and attachment
        		// 8.1 insert document attachment ot crmentity
        		mapper.insertDocumentAttachmentToCrmentity(lastIdSec, userId, assignTo);
        		log.info("insert document attachment to crmentity");
        		
        		// 8.2 insert document attachment to attachments
        		mapper.insertDocumentAttachmentToAttachments(lastIdSec, fileName, fileType, path);
        		log.info("insert document attachment to attachments");
        		
        		// step 9: insert to seattachmentrel
        		// 9.1 delete last sequence id from seattachmentrel
        		mapper.deleteSequenceIdFromSeattachmentrel(lastId);
        		log.info("delete last sequence id");
        		
        		// 9.2 insert last sequence id to seattachmentrel
        		mapper.insertSequenceIdToSeattachmentrel(lastId, lastIdSec);
        		log.info("insert the last sequence id to seattachmentrel");
        		
        		// step 10: update ticket status to crmentity
        		mapper.updateStatusTicketInCrmentity(userId, ticketId);
        		log.info("update ticket status");
        		
        		// bikin directory untuk menampung file yg diupload
        	
        		File directory = new File(path + dateFormatting() + lastIdSec + "_" + fileName);
        		log.info("directory: " + directory.exists());
        		if (!directory.exists()) {
        			log.info("membuat directory");
        			directory.mkdirs();
        		}
        		log.info("directory: " + directory.exists());
        		// penamaan file ({lastIdSec}_{fileName}
        		request.getFile().transferTo(directory);
        		
        		result = new ApiResponse("200", "Berhasil Menyimpan File", true);
        		break;
    		}
		  } catch (Exception e) {
			  log.error("ERROR: Terjadi kesalahan saat melakukan proses insert yang disebabkan oleh " + e.getMessage());
			  e.printStackTrace();
			  result = new ApiResponse("500", "Gagal Menyimpan File", false);
		  }
    return result;
  }
    private String dateFormatting() {
    	String result = "";
    	
    	try {
    		String year = LocalDate.now().format(DateTimeFormatter.ofPattern("YYYY"));
    		String month = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM"));
    		String week = LocalDate.now().format(DateTimeFormatter.ofPattern("W"));
			
    		result = "storage/" + year + "/" + month + "/week" + week + "/";
		} catch (Exception e) {
			log.error("ERROR: Terjadi kesalahan pada saat memformat tanggal yang disebabkan oleh " + e.getMessage());
		}
    	
    	return result;
    }
    
    public Object testCreate(InsertDocumentRequest file) {
    	// bikin directory untuk menampung file yg diupload
    	
    	Object result = null;
    	try {
    		if (file.getFile().getSize() > 3000000) {
    			result = new ApiResponse("400", "File size is too big", false);
    			log.info("file size: " + file.getFile().getSize());
    			return result;
    		}
//    		path =  path + dateFormatting();
    		log.info("path: " + path);
    		File directory = new File(path + dateFormatting() + file.getFile().getOriginalFilename());
    		log.info("directory: " + directory.exists());
    		if (!directory.exists()) {
    			log.info("membuat directory");
    			directory.mkdirs();
    		}
    		log.info("directory: " + directory.exists());
    		// penamaan file ({lastIdSec}_{fileName}
    		file.getFile().transferTo(directory);
    		result = new ApiResponse("00", "OK", true);
    	} catch (IOException e) {
    		log.error("ERROR: " + e.getMessage());
    		e.printStackTrace();
    	}
    	return result;
    }

}
