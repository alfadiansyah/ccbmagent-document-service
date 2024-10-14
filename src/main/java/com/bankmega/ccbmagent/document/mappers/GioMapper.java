package com.bankmega.ccbmagent.document.mappers;

import java.util.List;
import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Qualifier;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;
import com.bankmega.ccbmagent.document.model.responses.GetFolderResponse;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface GioMapper {


    List<GetDocumentResponse> getListDocument(@Param("paramTicketId") String paramTicketId);

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
    @Update("UPDATE vtiger_notes SET " +
            "filelocationtype = #{fileLocationType}, " +
            "filename = #{fileName}, " +
            "filestatus = #{fileStatus}, " +
            "fileversion = #{fileVersion}, " +
            "folderid = #{folderId}, " +
            "notecontent = #{descriptionAttachment}, " +
            "title = #{title} " +
            "WHERE notesid = #{documentId}")
    int updateVtigerNotes(
            @Param("fileLocationType") String fileLocationType,
            @Param("fileName") String fileName,
            @Param("fileStatus") Integer fileStatus,
            @Param("fileVersion") String fileVersion,
            @Param("folderId") Integer folderId,
            @Param("descriptionAttachment") String descriptionAttachment,
            @Param("title") String title,
            @Param("documentId") long documentId);

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

    // DELETE and INSERT into seattachmentsrel
    @Delete("DELETE FROM vtiger_seattachmentsrel WHERE crmid = #{documentId}")
    int deleteFromSeAttachmentsRel(@Param("documentId") long documentId);

    @Insert("INSERT INTO vtiger_seattachmentsrel (crmid, attachmentsid) VALUES (#{documentId}, #{attachmentsId})")
    int insertIntoSeAttachmentsRel(@Param("documentId") long documentId, @Param("attachmentsId") long attachmentsId);
}
