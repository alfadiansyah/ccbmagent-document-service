package com.bankmega.ccbmagent.document.mappers;

import java.util.List;
import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Qualifier;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.TicketRequest;
import com.bankmega.ccbmagent.document.model.responses.GetFolderResponse;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface GioMapper {

    // ===================== GET FOLDER =====================

    @Select("SELECT folderid, foldername FROM vtiger_attachmentsfolder ORDER BY foldername ASC")
    List<GetFolderResponse> getFolders();
    // ===================== Division Queries =====================
    
    @Select("SELECT md.divisiid, md.nama " +
            "FROM mk_divisi md " +
            "LEFT JOIN mk_divisi_hide mdh ON md.divisiid = mdh.divisiid " +
            "WHERE mdh.divisiid IS NULL " +
            "ORDER BY md.nama")
    @Results({
        @Result(property = "divisiId", column = "divisiid"),
        @Result(property = "nama", column = "nama")
    })
    List<GetAssigntoAttachmentDivision> getActiveDivisions();

    // ===================== Bank Mega Queries =====================

    @Select("SELECT id, user_name, first_name, last_name " +
            "FROM vtiger_users " +
            "WHERE status = 'Active' AND deleted = '0' " +
            "ORDER BY first_name")
    @Results({
        @Result(property = "id", column = "id"),
        @Result(property = "userName", column = "user_name"),
        @Result(property = "firstName", column = "first_name"),
        @Result(property = "lastName", column = "last_name")
    })
    List<GetAssigntoAttachmentBankMegaRequest> getActiveUsersForBankMega();

    @Select("SELECT vtu.id, vtu.user_name, vtu.first_name, vtu.last_name, vtr.rolename " +
            "FROM vtiger_users vtu " +
            "LEFT JOIN vtiger_user2role vturole ON vtu.id = vturole.userid " +
            "LEFT JOIN vtiger_role vtr ON vturole.roleid = vtr.roleid " +
            "WHERE vtu.status = 'Active' AND vtu.deleted = '0' " +
            "AND vtr.rolename LIKE '%Syariah' " +
            "ORDER BY vtu.first_name")
    @Results({
        @Result(property = "id", column = "id"),
        @Result(property = "userName", column = "user_name"),
        @Result(property = "firstName", column = "first_name"),
        @Result(property = "lastName", column = "last_name"),
        @Result(property = "roleName", column = "rolename")
    })
    List<GetAssigntoAttachmentSyariahBankMegaRequest> getActiveUsersForMegaSyariah();

    // ===================== IP Whitelist Queries =====================

    @Select("SELECT ip_address FROM whitelist_ip_access WHERE access_function = #{accessFunction}")
    List<String> getWhitelistedIpsByFunction(String accessFunction);

    // ===================== Update Document Queries =====================
    
    // UPDATE CRMEntity
    @Update("UPDATE vtiger_crmentity SET " +
            "smownerid = #{assignTo}, " +
            "modifiedby = #{userId}, " +
            "description = NULL, " +
            "modifiedtime = NOW() " +
            "WHERE crmid = #{documentId}")
    void updateVtigerCrmEntity(
            @Param("assignTo") String assignTo,
            @Param("userId") String userId,
            @Param("documentId") long documentId);

    // UPDATE OWNERNotify
    @Delete("DELETE FROM vtiger_ownernotify WHERE crmid = #{documentId}")
    int deleteOwnerNotifyByCrmId(@Param("documentId") long documentId);

    @Insert("INSERT INTO vtiger_ownernotify (crmid, smownerid, flag) VALUES (#{crmid}, #{smownerid}, 0)")
    void insertOwnerNotify(@Param("crmid") long crmid, @Param("smownerid") String smownerid);

    // UPDATE vtiger_notes
    @Update("<script>" +
        "UPDATE vtiger_notes SET " +
        "filelocationtype = #{fileLocationType}, " +
        "<if test='fileName != null'>filename = #{fileName}, </if>" +  // Update hanya jika fileName tidak null
        "filestatus = #{fileStatus}, " +
        "fileversion = #{fileVersion}, " +
        "folderid = #{folderId}, " +
        "notecontent = #{descriptionAttachment}, " +
        "title = #{title} " +
        "WHERE notesid = #{documentId}" +
        "</script>")
int updateVtigerNotes(
    @Param("fileLocationType") String fileLocationType,
    @Param("fileName") String fileName,
    @Param("fileStatus") Integer fileStatus,
    @Param("fileVersion") String fileVersion,
    @Param("folderId") Integer folderId,
    @Param("descriptionAttachment") String descriptionAttachment,
    @Param("title") String title,
    @Param("documentId") long documentId);


    @Select("SELECT filename FROM vtiger_notes WHERE notesid = #{documentId}")
        String getFileNameByDocumentId(@Param("documentId") long documentId);
    // UPDATE Sequence ID
    
    @Update("UPDATE vtiger_crmentity_seq SET id = LAST_INSERT_ID(id + 1)")
    void updateSequenceId();
    @Select("SELECT LAST_INSERT_ID()")
    long getLastInsertId();


    // INSERT into vtiger_crmentity
    @Insert("INSERT INTO vtiger_crmentity " +
            "(crmid, smcreatorid, smownerid, setype, description, createdtime, modifiedtime) " +
            "VALUES (#{crmid}, #{userId}, #{assignTo}, 'Documents Attachment', NULL, NOW(), NOW())")
    int insertVtigerCrmentity(
            @Param("crmid") long crmid,
            @Param("userId") String userId,
            @Param("assignTo") String assignTo);

    @Insert("INSERT INTO vtiger_attachments (attachmentsid, name, description, type, path) " +
            "VALUES (#{attachmentsId}, #{name}, #{description}, #{type}, #{path})")
    int insertVtigerAttachment(
            @Param("attachmentsId") long attachmentsId,
            @Param("name") String name,
            @Param("description") String description,
            @Param("type") String type,
            @Param("path") String path);

    // DELETE and INSERT into seattachmentsrel
    @Delete("DELETE FROM vtiger_seattachmentsrel WHERE crmid = #{documentId}")
    int deleteFromSeAttachmentsRel(@Param("documentId") long documentId);

    @Insert("INSERT INTO vtiger_seattachmentsrel (crmid, attachmentsid) VALUES (#{documentId}, #{attachmentsId})")
    int insertIntoSeAttachmentsRel(@Param("documentId") long documentId, @Param("attachmentsId") long attachmentsId);

    // LIST DATA TICKET STATUS
    @Select("<script>" +
            "SELECT vtt.ticket_no, vtc.createdtime, vtcf.cf_667, vtcf.cf_701, vtt.priority, vtt.status " +
            "FROM vtiger_crmentity vtc " +
            "LEFT JOIN vtiger_ticketcf vtcf ON vtc.crmid = vtcf.ticketid " +
            "INNER JOIN vtiger_troubletickets vtt ON vtc.crmid = vtt.ticketid " +
            "LEFT JOIN vtiger_ticketcomments vttc ON vtc.crmid = vttc.ticketid " +
            "LEFT JOIN vtiger_users vtu ON vtc.smcreatorid = vtu.id " +
            "WHERE vtc.smcreatorid = #{userId} AND vtt.status IN ('Open', 'In Progress') " +
            "LIMIT #{limit} OFFSET #{offset}" +
            "</script>")
    @Results({
        @Result(property = "ticketNo", column = "ticket_no"),
        @Result(property = "createdTime", column = "createdtime"),
        @Result(property = "cf667", column = "cf_667"),
        @Result(property = "cf701", column = "cf_701"),
        @Result(property = "priority", column = "priority"),
        @Result(property = "status", column = "status")
    })
    List<TicketRequest> getTicketsByUserId(@Param("userId") int userId,
                                           @Param("limit") int limit,
                                           @Param("offset") int offset);

    @Select("SELECT COUNT(*) FROM vtiger_crmentity vtc " +
            "WHERE vtc.smcreatorid = #{userId}")
    int countTicketsByUserId(@Param("userId") int userId);

// SEARCH TICKET
@Select("<script>" +
        "SELECT vtt.ticket_no, vtc.createdtime, vtcf.cf_667, vtcf.cf_701, vtt.priority, vtt.status " +
        "FROM vtiger_crmentity vtc " +
        "LEFT JOIN vtiger_ticketcf vtcf ON vtc.crmid = vtcf.ticketid " +
        "INNER JOIN vtiger_troubletickets vtt ON vtc.crmid = vtt.ticketid " +
        "LEFT JOIN vtiger_ticketcomments vttc ON vtc.crmid = vttc.ticketid " +
        "LEFT JOIN vtiger_users vtu ON vtc.smcreatorid = vtu.id " +
        "WHERE vtc.smcreatorid = #{userId} " +
        "AND vtt.status IN ('Open', 'In Progress') " +
        "<if test='searchBy != null and keyword != null'>" +
        "AND " +
        "<choose>" +
        "<when test='searchBy == \"cf_701\"'>vtcf.cf_701 LIKE CONCAT('%', #{keyword}, '%')</when>" +
        "<when test='searchBy == \"cf_644\"'>vtcf.cf_644 LIKE CONCAT('%', #{keyword}, '%')</when>" +
        "<when test='searchBy == \"cf_720\"'>vtcf.cf_720 LIKE CONCAT('%', #{keyword}, '%')</when>" +
        "<when test='searchBy == \"ticketNo\"'>vtt.ticket_no LIKE CONCAT('%', #{keyword}, '%')</when>" +
        "</choose>" +
        "</if> " +
        "LIMIT #{limit} OFFSET #{offset}" +
        "</script>")
@Results({
        @Result(property = "ticketNo", column = "ticket_no"),
        @Result(property = "createdTime", column = "createdtime"),
        @Result(property = "cf667", column = "cf_667"),
        @Result(property = "cf701", column = "cf_701"),
        @Result(property = "priority", column = "priority"),
        @Result(property = "status", column = "status")
    })
List<TicketRequest> searchTickets(@Param("userId") int userId, 
                                  @Param("searchBy") String searchBy, 
                                  @Param("keyword") String keyword,
                                  @Param("limit") int limit,
                                  @Param("offset") int offset);
                                  @Select("<script>" +
                                  "SELECT COUNT(*) " +
                                  "FROM vtiger_crmentity vtc " +
                                  "LEFT JOIN vtiger_ticketcf vtcf ON vtc.crmid = vtcf.ticketid " +
                                  "INNER JOIN vtiger_troubletickets vtt ON vtc.crmid = vtt.ticketid " +
                                  "WHERE vtc.smcreatorid = #{userId} " +
                                  "AND vtt.status IN ('Open', 'In Progress') " +
                                  "<if test='searchBy != null and keyword != null'>" +
                                  "AND " +
                                  "<choose>" +
                                  "<when test='searchBy == \"cf_701\"'>vtcf.cf_701 LIKE CONCAT('%', #{keyword}, '%')</when>" +
                                  "<when test='searchBy == \"cf_644\"'>vtcf.cf_644 LIKE CONCAT('%', #{keyword}, '%')</when>" +
                                  "<when test='searchBy == \"cf_720\"'>vtcf.cf_720 LIKE CONCAT('%', #{keyword}, '%')</when>" +
                                  "<when test='searchBy == \"ticketNo\"'>vtt.ticket_no LIKE CONCAT('%', #{keyword}, '%')</when>" +
                                  "</choose>" +
                                  "</if>" +
                                  "</script>")
                          int countSearchResults(@Param("userId") int userId, 
                                                 @Param("searchBy") String searchBy, 
                                                 @Param("keyword") String keyword);
}
