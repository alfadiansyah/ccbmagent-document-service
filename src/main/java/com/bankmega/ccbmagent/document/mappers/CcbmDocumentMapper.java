package com.bankmega.ccbmagent.document.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Qualifier;

import com.bankmega.ccbmagent.document.model.responses.DataCurrent;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;
import com.bankmega.ccbmagent.document.model.responses.GetFolderResponse;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface CcbmDocumentMapper {

    @Insert
    ("insert into"
        + " vtiger_crmentity("
        + " crmid,"
        + " smcreatorid,"
        + " smownerid, "
        + " setype,"
        + " description,"
        + " modifiedby,"
        + " createdtime,"
        + " modifiedtime "
        + " ) values ("
        + " #{lastId},"
        + " #{userId},"
        + " #{assignTo},"
        + " 'Documents',"
        + " NULL,"
        + " #{userIdLogin},"
        + " #{insertDate},"
        + " #{updateDate} "
        + ");")
    void insertingData(
        @Param("lastId") String lastId, 
        @Param("userId") String userId, 
        @Param("assignTo") String assignTo, 
        @Param("userIdLogin") String userIdLogin, 
        @Param("insertDate") String insertDate, 
        @Param("updateDate") String updateDate
    );

    // Remove the @Insert annotation here
    @Update
    ("update"
        + " vtiger_crmentity_seq "
        + "set"
        + " id = LAST_INSERT_ID(id + 1);")
    void updateLastId();

    @Update
    ("update"
        + " vtiger_modentity_num "
        + "set"
        + " cur_id = #{futureId} "
        + "where"
        + " cur_id = #{pastId} "
        + "and"
        + " active = 1 "
        + "and"
        + " semodule = 'Documents';"
        + "unlock tables;")
    void updateAndUnlockModentity(@Param("futureId") String futureId, @Param("pastId") String pastId);

    @Select
    ("select"
        + " vcs.id as id "
        + "from"
        + " vtigercrm54.vtiger_crmentity_seq vcs;")
    String ambilDataLastId();

    @Select
    ("lock tables"
        + " vtiger_modentity_num "
        + "write;"
        + "select"
        + " cur_id as currentId,"
        + " prefix as prefix "
        + "from"
        + " vtiger_modentity_num vmn "
        + "where"
        + " semodule = 'Documents' "
        + "and"
        + " active = 1;")
    DataCurrent lockAndSelectCurrentId();

    @Select("select 3")
    String test();

    @Select(
        "SELECT "
        + "CASE "
        + "WHEN"
        + "  ( vtiger_users.user_name NOT LIKE '' ) "
        + "    THEN"
        + "      CONCAT"
        + "        ( vtiger_users.first_name, ' ', vtiger_users.last_name ) "
        + "    ELSE "
        + "      vtiger_groups.groupname"
        + "    END AS "
        + "      userName,"
        + "    'Documents' AS activityType,"
        + "    vtiger_attachments.type AS fileType,"
        + "    vtiger_attachments.path AS path,"
        + "    crm2.modifiedtime AS lastModified,"
        + "    vtiger_crmentity.modifiedtime AS modifiedTime,"
        + "    vtiger_seattachmentsrel.attachmentsid AS attachmentSid,"
        + "    vtiger_notes.notesid AS crmId,"
        + "    vtiger_notes.notecontent AS description,"
        + "    vtiger_notes.*  "
        + "FROM"
        + "  vtiger_notes "
        + "INNER JOIN"
        + "  vtiger_senotesrel "
        + "ON"
        + "  vtiger_senotesrel.notesid = vtiger_notes.notesid "
        + "INNER JOIN"
        + "  vtiger_crmentity ON vtiger_crmentity.crmid = vtiger_notes.notesid "
        + "AND"
        + "  vtiger_crmentity.deleted = 0 "
        + "INNER JOIN"
        + "  vtiger_crmentity crm2 ON crm2.crmid = vtiger_senotesrel.crmid "
        + "LEFT JOIN"
        + "  vtiger_groups ON vtiger_groups.groupid = vtiger_crmentity.smownerid "
        + "LEFT JOIN"
        + "  vtiger_seattachmentsrel ON vtiger_seattachmentsrel.crmid = vtiger_notes.notesid "
        + "LEFT JOIN"
        + "  vtiger_attachments "
        + "ON"
        + "  vtiger_seattachmentsrel.attachmentsid = vtiger_attachments.attachmentsid "
        + "LEFT JOIN "
        + "  vtiger_users ON vtiger_crmentity.smownerid = vtiger_users.id "
        + "WHERE"
        + "  crm2.crmid = ${paramTicketId}"
    )
    
    List<GetDocumentResponse> getListDocument(@Param("paramTicketId") String paramTicketId);

    @Select("SELECT folderid, foldername FROM vtiger_attachmentsfolder ORDER BY foldername ASC")
    List<GetFolderResponse> getFolders();
}
