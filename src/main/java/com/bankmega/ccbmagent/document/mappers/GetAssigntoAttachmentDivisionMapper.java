package com.bankmega.ccbmagent.document.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Qualifier;

import com.bankmega.ccbmagent.document.model.requests.GetAssigntoAttachmentDivision;

@Mapper
@Qualifier("sqlSessionTemplateMaster")
public interface GetAssigntoAttachmentDivisionMapper {
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
}
