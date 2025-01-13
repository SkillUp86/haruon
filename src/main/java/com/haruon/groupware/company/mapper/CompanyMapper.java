package com.haruon.groupware.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.company.entity.Company;

@Mapper
public interface CompanyMapper {
	Company selectCompanyInfo();
}
