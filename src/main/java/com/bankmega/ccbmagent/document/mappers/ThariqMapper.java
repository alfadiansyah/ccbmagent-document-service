package com.bankmega.ccbmagent.document.mappers;

import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.beans.factory.annotation.Qualifier;

import com.bankmega.ccbmagent.document.model.responses.DataCurrent;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface ThariqMapper {

	public static class Query {

		// step 3 & 7: update and select the last sequence id
		// 3.1 & 7.1
		public String updateIdSequence() {
			return "update"
						+ " vtiger_crmentity_seq "
					+ "set"
						+ " id = LAST_INSERT_ID(id + 1);";
		}

		// 3.2 & 7.2
		public String selectIdSequnce() {
			return "select"
						+ " id "
					+ "from"
						+ " vtiger_crmentity_seq;";
			}

		// step 4: inserting document to crmentity
		public String insertDocumentToCrmentity(Integer lastId, Integer userId, Integer assignTo) {
			return "insert into"
					+ " vtiger_crmentity ("
						+ " crmid,"
						+ " smcreatorid,"
						+ " smownerid,"
						+ " setype,"
						+ " description,"
						+ " modifiedby,"
						+ " createdtime,"
						+ " modifiedtime "
					+ ") values ("
						+ " " + lastId + ","
						+ " " + userId + ","
						+ " " + assignTo + ","
						+ " 'Documents',"
						+ " NULL,"
						+ " " + userId + ","
						+ " now(),"
						+ " now() "
					+ ");";
		}

		// step 5: select cur_id and update it at modentity
		// 5.1
		public String lockTables(String tableName) {
			return "lock tables " + tableName + " write;";
		}
		
		// 5.2
		public String selectCurrentId() {
			return "select"
						+ " cur_id as currentId,"
						+ " prefix as prefix "
					+ "from"
						+ " vtiger_modentity_num "
					+ "where"
						+ " semodule = 'Documents' "
					+ "and"
						+ " active = 1;";
		}

		// 5.3
		public String updateCurrentId(String pastCurId, String futureCurId) {
			return "update"
						+ " vtiger_modentity_num "
					+ "set"
						+ " cur_id = '" + futureCurId + "' "
					+ "where"
						+ " cur_id = '" + pastCurId + "' "
					+ "and"
						+ " active = 1 "
					+ "and"
						+ " semodule = 'Documents';";
		}
		
		// 5.4
		public String unlockTables() {
			return "unlock tables;";
		}

		// step 6: insert and update document to notes and senotesrel
		// 6.1
		public String insertDocumentToNotes(Integer lastId, String title, String description, Boolean status, String folderId, String documentSequence) {
			return "insert into"
						+ " vtiger_notes ("
							+ " notesid,"
							+ " title,"
							+ " filename,"
							+ " notecontent,"
							+ " filelocationtype,"
							+ " fileversion,"
							+ " filestatus,"
							+ " folderid,"
							+ " note_no "
						+ ") values ("
							+ " " + lastId + ","
							+ " '" + title + "',"
							+ " NULL,"
							+ " '" + description + "',"
							+ " 'I',"
							+ " '',"
							+ " " + status + ","
							+ " '" + folderId + "',"
							+ " '" + documentSequence + "' "
						+ ");";
		}

		// 6.2
		public String insertDocumentNotes(Integer ticketId, Integer lastId) {
			return "insert into"
						+ " vtiger_senotesrel ("
							+ " crmid,"
							+ " notesid "
						+ ") values ("
							+ " " + ticketId + ","
							+ " " + lastId + " "
						+ ");";
		}

		// 6.3
		public String updateDocumentDetailsInNotes(String fileName, Integer fileSize, String fileType, Integer lastId) {
			return "update"
						+ " vtiger_notes "
					+ "set"
						+ " filename = '" + fileName + "',"
						+ " filesize = " + fileSize + ","
						+ " filetype = '" + fileType + "',"
						+ " filelocationtype = 'I', "
						+ " filedownloadcount = NULL "
					+ "where"
						+ " notesid = " + lastId + ";";
		}

		// step 8: insert document attachment to crmentity and attachments
		// 8.1
		public String insertDocumentAttachmentToCrmentity(Integer lastId, Integer userId, Integer assignTo) {
			return "insert into"
						+ " vtiger_crmentity ("
							+ " crmid,"
							+ " smcreatorid,"
							+ " smownerid,"
							+ " setype,"
							+ " description,"
							+ " createdtime,"
							+ " modifiedtime "
						+ ") values ("
							+ " " + lastId + ","
							+ " " + userId + ","
							+ " " + assignTo + ","
							+ " 'Documents Attachment',"
							+ " NULL,"
							+ " now(),"
							+ " now()"
						+ ");";
		}

		// 8.2
		public String insertDocumentAttachmentToAttachments(Integer lastId, String fileName, String fileType, String path) {
			return "insert into"
						+ " vtiger_attachments ("
							+ " attachmentsid,"
							+ " name,"
							+ " description,"
							+ " type,"
							+ " path "
						+ ") values ("
							+ " " + lastId + ","
							+ " '" + fileName + "',"
							+ " NULL,"
							+ " '" + fileType + "',"
							+ " '" + path + "'"
						+ ");";
		}

		// step 9: delete id sequence and insert to seattachmentrel
		// 9.1
		public String deleteSequenceIdFromSeattachmentrel(Integer lastId) {
			return "delete from"
						+ " vtiger_seattachmentsrel "
					+ "where"
						+ " crmid = " + lastId + ";";
		}

		// 9.2
		public String insertSequenceIdToSeattachmentrel(Integer lastId, Integer secLastId) {
			return "insert into"
						+ " vtiger_seattachmentsrel ("
							+ " crmid,"
							+ " attachmentsid "
						+ ") values ("
							+ " " + lastId + ","
							+ " " + secLastId + ""
						+ ");";
		}

		// step 10: update ticket status in crmentity
		public String updateStatusTicketInCrmentity(Integer userId, Integer ticketId) {
    		return "update"
    					+ " vtiger_crmentity "
    				+ "set"
    					+ " modifiedtime = now(),"
    					+ " modifiedby = " + userId + " "
    				+ "where"
    					+ " crmid = " + ticketId + ";";
		}
		
	}

	// step 3 & 7: update & select
	@UpdateProvider(type = Query.class, method = "updateIdSequence")
	public void updateIdSequence();

	@SelectProvider(type = Query.class, method = "selectIdSequnce")
	public Integer selectIdSequnce();

	// step 4: inserting document to crmentity
	@InsertProvider(type = Query.class, method = "insertDocumentToCrmentity")
	public void insertDocumentToCrmentity(Integer lastId, Integer userId, Integer assignTo);

	// step 5: select cur_id and update it at modentity
	@UpdateProvider(type = Query.class, method = "lockTables")
	public void lockTable(@Param("tableName") String tableName);

	@SelectProvider(type = Query.class, method = "selectCurrentId")
	public DataCurrent selectCurrentId();

	@UpdateProvider(type = Query.class, method = "updateCurrentId")
	public void updateCurrentId(String pastCurId, String futureCurId);

	@UpdateProvider(type = Query.class, method = "unlockTables")
	public void unlockTable();

	// step 6: insert and update document to notes and senotesrel
	@InsertProvider(type = Query.class, method = "insertDocumentToNotes")
	public void insertDocumentToNotes(Integer lastId, String title, String description, Boolean status, String folderId, String documentSequence);

	@InsertProvider(type = Query.class, method = "insertDocumentNotes")
	public void insertDocumentNotes(Integer ticketId, Integer lastId);

	@UpdateProvider(type = Query.class, method = "updateDocumentDetailsInNotes")
	public void updateDocumentDetailsInNotes(String fileName, Integer fileSize, String fileType, Integer lastId);

	// step 8: insert document attachment to 
	@InsertProvider(type = Query.class, method = "insertDocumentAttachmentToCrmentity")
	public void insertDocumentAttachmentToCrmentity(Integer lastId, Integer userId, Integer assignTo);

	@InsertProvider(type = Query.class, method = "insertDocumentAttachmentToAttachments")
	public void insertDocumentAttachmentToAttachments(Integer lastId, String fileName, String fileType, String path);

	// step 9: delete and update sequence id in seattachmentrel
	@DeleteProvider(type = Query.class, method = "deleteSequenceIdFromSeattachmentrel")
	public void deleteSequenceIdFromSeattachmentrel(Integer lastId);

	@InsertProvider(type = Query.class, method = "insertSequenceIdToSeattachmentrel")
	public void insertSequenceIdToSeattachmentrel(Integer lastId, Integer secLastId);

	// step 10: update ticket status in crmentity
	@UpdateProvider(type = Query.class, method = "updateStatusTicketInCrmentity")
	public void updateStatusTicketInCrmentity(Integer userId, Integer ticketId);

}
