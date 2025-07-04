package com.bankmega.ccbmagent.document.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Qualifier;

import com.bankmega.ccbmagent.document.model.responses.CheckIsDocumentDeletedResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentLocationResponse;
import com.bankmega.ccbmagent.document.model.responses.GetDocumentResponse;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface JohnSungMapper {

	@Select("select 3")
    public String test();

    @Select(
            "SELECT "
            + "CASE "
            + "WHEN"
            + "		( vtiger_users.user_name NOT LIKE '' ) "
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
            + "    vaf.foldername AS folderName,"
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
            + "LEFT JOIN "
            + "  vtiger_attachmentsfolder vaf ON vtiger_notes.folderid = vaf.folderid "
            + "WHERE"
            + "  crm2.crmid = ${paramTicketId}"
    )
    public List<GetDocumentResponse> getListDocument(@Param("paramTicketId") String paramTicketId);

    @Select("SELECT deleted AS deleted FROM vtiger_crmentity WHERE crmid='${documentId}'")
    public CheckIsDocumentDeletedResponse checkIsDocumentDeleted(String documentId);

    //path document: format: 
    @Select("SELECT path as path, attachmentsid as attachmentsId, name as name FROM vtiger_attachments WHERE attachmentsid = '${documentId}'")
    public GetDocumentLocationResponse getDocumentLocation(String documentId);

    //nanti disini dapet integer jumlah count
    @Select("SELECT filedownloadcount AS fileDownloadCount from vtiger_notes where notesid= '${documentId}'")
    public Integer getDocumentDownloadCount(String documentId);

    //jumlah count +1 update kesini
    @Update("UPDATE vtiger_notes set filedownloadcount= ${fileDownloadCount} where notesid= '${documentId}'")
    public void updateDocumentDownloadStatus(String documentId, Integer fileDownloadCount);

    //Cek Ketersediaan data untuk delete document
    @Select("SELECT count(*) as count FROM vtiger_senotesrel WHERE notesid = '${documentId}' AND crmid = '${ticketId}'")
    public Integer findDocumentByDocumentIdAndTicketId(String documentId, String ticketId);

    //Delete document
    @Delete("DELETE FROM vtiger_senotesrel WHERE notesid = '${documentId}' AND crmid = '${ticketId}'")
    public void deleteDocumentByDocumentIdAndTicketId(String documentId, String ticketId);

    //Update document status
    @Update("UPDATE vtiger_crmentity SET modifiedtime = '${timeStamp}', modifiedby = '${userId}' WHERE crmid = '${ticketId}'")
    public void updateDocumentStatus(String timeStamp, String userId, String ticketId);

    //Get log sebelumnya
    @Select("SELECT update_log AS log FROM vtiger_troubletickets WHERE ticketId = '${ticketId}'")
    public String getDocumentLogPreviousLogByTicketId(String ticketId);

    //set update log (detil log cek lagi di github)
    //log: [isi log sebelumnya + Document namafile was deleted [hari tanggal bulan tahun time AM/PM] by [paramUserId]]
    @Update("UPDATE vtiger_troubletickets SET update_log = '${log}' WHERE ticketid = '${ticketId}'")
    public void setDocumentUpdateLog(String log, String ticketId);

    @Select("SELECT filename as filename FROM vtiger_notes WHERE notesid = '${documentId}'")
    public String getDocumentFileNameByDocumentId(String documentId);

    @Select("SELECT user_name as userName FROM vtiger_users WHERE id = '${userId}'")
    public String getUserNameByUserId(String userId);

}
