package com.bankmega.ccbmagent.document.mappers;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Qualifier;

@Mapper
@Qualifier("sqlSessionTemplateMasterUpdate")
public interface updateCcbmDocumentMapper {

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

        @Insert("INSERT INTO vtiger_ownernotify (crmid, smownerid, flag) VALUES (#{crmid}, #{smownerid},0)")
        void insertOwnerNotify(@Param("crmid") long crmid, @Param("smownerid") String smownerid);

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

        // UPDATE SEQUENCE_ID
        @Update("UPDATE vtiger_crmentity_seq SET id = LAST_INSERT_ID(id + 1)")
        void updateSequenceId();

        @Select("SELECT LAST_INSERT_ID()")
        long getLastInsertId();

        // INSERT INTO vtiger_crmentity
        @Insert("INSERT INTO vtiger_crmentity " +
                        "(crmid, smcreatorid, smownerid, setype, description, createdtime, modifiedtime) " +
                        "VALUES " +
                        "(#{crmid}, #{userId}, #{assignTo}, 'Documents Attachment', NULL, NOW(), NOW())")
        int insertVtigerCrmentity(@Param("crmid") long crmid,
                        @Param("userId") String userId,
                        @Param("assignTo") String assignTo);

        @Delete("DELETE FROM vtiger_seattachmentsrel WHERE crmid = #{documentId}")
        int deleteFromSeAttachmentsRel(@Param("documentId") long documentId);

        @Insert("INSERT INTO vtiger_seattachmentsrel (crmid, attachmentsid) VALUES (#{documentId}, #{attachmentsId})")
        int insertIntoSeAttachmentsRel(@Param("documentId") long documentId,
                        @Param("attachmentsId") long attachmentsId);
}
