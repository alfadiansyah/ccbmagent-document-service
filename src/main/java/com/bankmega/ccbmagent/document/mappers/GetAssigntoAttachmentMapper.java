package com.bankmega.ccbmagent.document.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Qualifier;

import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentBankMegaRequest;
import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentSyariahBankMegaRequest;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface GetAssigntoAttachmentMapper {
  // For Bank Mega
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

}
