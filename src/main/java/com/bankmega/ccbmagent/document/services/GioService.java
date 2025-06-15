package com.bankmega.ccbmagent.document.services;

import java.util.*;
import java.util.stream.Collectors;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bankmega.ccbmagent.document.mappers.GioMapper;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.TicketRequest;
import com.bankmega.ccbmagent.document.model.requests.UpdateDocumentRequest;
import com.bankmega.ccbmagent.document.model.responses.GetAssigntoAttachmentResponse;
import com.bankmega.ccbmagent.document.model.responses.GetFolderResponse;

import mampang.validation.dto.MampangApiResponse;

@Service
public class GioService {

    private final GioMapper gioMapper;
    private final Set<String> whitelistedIps = new HashSet<>();
    private static final long MAX_FILE_SIZE = 3 * 1024 * 1024; 
	private final Log log = LogFactory.getLog(getClass());
    private static final int PAGE_SIZE = 15;


    @Autowired
    public GioService(GioMapper gioMapper) {
        this.gioMapper = gioMapper;
        reloadWhitelistedIps("api_attachment"); 
    }

    public HttpEntity<MampangApiResponse> getFolders() {
        try {
            List<GetFolderResponse> folders = gioMapper.getFolders();
			
            MampangApiResponse response = new MampangApiResponse(folders, "00", "Success");
            response.setRc("00");
            response.setRd("Success");
            response.setData(folders);
            
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            MampangApiResponse errorResponse = new MampangApiResponse(e.getMessage(), "01", "Error retrieving folders");
			
			errorResponse.setRc("01");
            errorResponse.setRd("Error retrieving folders");
            errorResponse.setData(e.getMessage());
            
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public GetAssigntoAttachmentResponse getCombinedUserAndDivisionData(String channel) {
        List<GetAssigntoAttachmentBankMegaRequest> bankMegaUsers = new ArrayList<>();
        List<GetAssigntoAttachmentSyariahBankMegaRequest> syariahBankMegaUsers = new ArrayList<>();
        List<GetAssigntoAttachmentDivision> divisions = new ArrayList<>();

        switch (channel) {
            case "Bank Mega":
                bankMegaUsers = gioMapper.getActiveUsersForBankMega()
                    .stream()
                    .filter(user -> user.getUserName() != null && !user.getUserName().isEmpty())
                    .collect(Collectors.toList());
                break;
            case "Mega Syariah":
                syariahBankMegaUsers = gioMapper.getActiveUsersForMegaSyariah()
                    .stream()
                    .filter(user -> user.getUserName() != null && !user.getUserName().isEmpty())
                    .collect(Collectors.toList());
                break;
            default:
                throw new IllegalArgumentException("Invalid channel: " + channel);
        }
        divisions = gioMapper.getActiveDivisions();

        return GetAssigntoAttachmentResponse.builder()
                .userData(channel.equals("Bank Mega") ? bankMegaUsers : syariahBankMegaUsers)
                .divisiData(divisions)
                .build();
    }

    public void reloadWhitelistedIps(String accessFunction) {
        try {
            List<String> ipList = gioMapper.getWhitelistedIpsByFunction(accessFunction);
            whitelistedIps.clear();
            whitelistedIps.addAll(ipList);
            System.out.println("Whitelisted IPs reloaded: " + whitelistedIps);
        } catch (Exception e) {
            System.err.println("Error loading whitelisted IPs: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean isIpWhitelisted(String ip) {
        return whitelistedIps.contains(ip);
    }

    public void updateAttachment(UpdateDocumentRequest request) throws IOException {
        if (request.getFile() == null || request.getFile().isEmpty()) {
            gioMapper.updateVtigerCrmEntity(
                    request.getAssignTo(),
                    request.getUserId(),
                    request.getDocumentId());
    
            gioMapper.updateVtigerNotes(
                    request.getFileLocationType(),
                    null, 
                    request.getFileStatus() ? 1 : 0,
                    request.getFileVersion(),
                    Integer.parseInt(request.getFolderId()),
                    request.getDescriptionAttachment(),
                    request.getTitle(),
                    request.getDocumentId());
    
            gioMapper.deleteOwnerNotifyByCrmId(request.getDocumentId());
            gioMapper.insertOwnerNotify(request.getDocumentId(), request.getAssignTo());
    
            return;
        }
    
        MultipartFile file = request.getFile();
        if (file != null && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            gioMapper.updateSequenceId();
            long lastInsertId = getLastInsertId(); 
    
            long fileSize = file.getSize();
            String fileType = file.getContentType();
            String path = "/data/document-service/storage/"; 
            String datePath = getPathFromDate(); 
    
            String fullPath = path + datePath; 
    
            saveFile(file, fullPath);
            
            int insertCrmEntityResult = gioMapper.insertVtigerCrmentity(
                lastInsertId, request.getUserId(), request.getAssignTo());
            if (insertCrmEntityResult <= 0) {
                throw new RuntimeException("Failed to insert into vtiger_crmentity");
            }
    
            gioMapper.updateVtigerCrmEntity(
                    request.getAssignTo(),
                    request.getUserId(),
                    request.getDocumentId());
    
            gioMapper.updateVtigerNotes(
                    request.getFileLocationType(),
                    fileName,
                    request.getFileStatus() ? 1 : 0,
                    request.getFileVersion(),
                    Integer.parseInt(request.getFolderId()),
                    request.getDescriptionAttachment(),
                    request.getTitle(),
                    request.getDocumentId());
    
            gioMapper.insertVtigerAttachment(
                lastInsertId, 
                fileName.replace(" ", "_"), 
                null, 
                fileType, 
                fullPath 
            );
    
            gioMapper.deleteFromSeAttachmentsRel(request.getDocumentId());
            gioMapper.insertIntoSeAttachmentsRel(request.getDocumentId(), getLastInsertId());
    
            gioMapper.deleteOwnerNotifyByCrmId(request.getDocumentId());
            gioMapper.insertOwnerNotify(request.getDocumentId(), request.getAssignTo());
        }
    }
    
    
    private void saveFile(MultipartFile file, String path) throws IOException {
        System.out.println("Saving file to path: " + path);

        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        long lastInsertId = getLastInsertId();

        String originalFilename = file.getOriginalFilename();
        String newFilename = generateUniqueFilename(path, originalFilename,lastInsertId);
    
        Files.copy(file.getInputStream(), Paths.get(path, newFilename), StandardCopyOption.REPLACE_EXISTING);
        System.out.println("File saved successfully: " + newFilename);

    }
    private String generateUniqueFilename(String path, String originalFilename, long lastInsertId) {
        String filename = originalFilename;
        String extension = "";
        int dotIndex = originalFilename.lastIndexOf('.');
        if (dotIndex > 0) {
            filename = originalFilename.substring(0, dotIndex);
            extension = originalFilename.substring(dotIndex);
        }
    
        filename = filename.replace(" ", "_");
        System.out.println("+++++++++++++++ "+filename);
        String newFilename = lastInsertId + "_" + filename + extension;
        System.out.println(newFilename);
        File file = new File(path, newFilename);
        int count = 1;
        while (file.exists()) {
            newFilename = lastInsertId + "_" + filename + "(" + count + ")" + extension;
            file = new File(path, newFilename);
            count++;
        }
    
        System.out.println("++++++++++"+newFilename);
        return newFilename;
    }
    
    
    private String getPathFromDate() {
        String year = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
        String month = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM"));
        String week = "week" + LocalDate.now().format(DateTimeFormatter.ofPattern("W"));
    
        return year + "/" + month + "/" + week + "/";
    }
    
    private long getLastInsertId() {
        return gioMapper.getLastInsertId();
    }

    public MampangApiResponse getTicketsByUserId(int userId, int page) {
        try {
            int offset = (page - 1) * PAGE_SIZE;

            List<TicketRequest> tickets = gioMapper.getTicketsByUserId(userId, PAGE_SIZE, offset);
            int totalRecords = gioMapper.countTicketsByUserId(userId);

            int totalPages = (int) Math.ceil((double) totalRecords / PAGE_SIZE);

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("tickets", tickets);
            responseData.put("totalRecords", totalRecords);
            responseData.put("totalPages", totalPages);
            responseData.put("currentPage", page);

            return new MampangApiResponse(responseData, "00", "Success");

        } catch (Exception e) {
            return new MampangApiResponse(e.getMessage(), "01", "Error retrieving tickets");
        }
    }

    public MampangApiResponse searchTickets(int userId, String searchBy, String keyword, int page) {
        try {
            int limit = 15;
            int offset = (page - 1) * limit;
    
            List<TicketRequest> tickets = gioMapper.searchTickets(userId, searchBy, keyword, limit, offset);
    
            int totalRecords = gioMapper.countSearchResults(userId, searchBy, keyword);
            int totalPages = (int) Math.ceil((double) totalRecords / limit);
    
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("tickets", tickets);
            responseData.put("totalRecords", totalRecords);
            responseData.put("totalPages", totalPages);
            responseData.put("currentPage", page);
    
            return new MampangApiResponse(responseData, "00", "Success");
    
        } catch (Exception e) {
            return new MampangApiResponse(e.getMessage(), "01", "Error retrieving tickets");
        }
    }
    
}