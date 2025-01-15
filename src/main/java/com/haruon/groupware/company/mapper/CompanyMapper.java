package com.haruon.groupware.company.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.company.entity.Company;

@Mapper
public interface CompanyMapper {
	Company selectCompanyInfo();
	
	Integer modifyCompanyInfo(Map<String,Object> map);
}
