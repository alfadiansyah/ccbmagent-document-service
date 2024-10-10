package com.bankmega.ccbmagent.document.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface IpWhitelistMapper {
    @Select("SELECT ip_address FROM whitelist_ip_access WHERE access_function = #{accessFunction}")
    List<String> getWhitelistedIpsByFunction(String accessFunction);
}
