package com.haruon.groupware.company.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.company.entity.Company;
import com.haruon.groupware.company.service.CompanyService;
@RestController
public class CompanyRestController {
	@Autowired CompanyService companyService;
	
	@GetMapping("/company/information")
	public ResponseEntity<Company> getCompanyInfo() {
		Company company = companyService.getCompanyInfo();
        return ResponseEntity.ok(company);
	}

}
