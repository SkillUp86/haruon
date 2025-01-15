package com.haruon.groupware.company.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.company.entity.Company;
import com.haruon.groupware.company.mapper.CompanyMapper;

@Service
@Transactional
public class CompanyService {
	@Autowired CompanyMapper companyMapper;
	
	public Company getCompanyInfo() {
		return companyMapper.selectCompanyInfo();
	}
	
	public Integer modifyCompanyInfo(Map<String,Object> map) {
		return companyMapper.modifyCompanyInfo(map);
	}
}
