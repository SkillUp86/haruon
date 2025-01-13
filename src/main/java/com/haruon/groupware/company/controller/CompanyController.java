package com.haruon.groupware.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.company.entity.Company;
import com.haruon.groupware.company.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired CompanyService companyService;
	
	@GetMapping("/company")
	public String getCompanyInfo(Model model) {
		Company company = companyService.getCompanyInfo();
        model.addAttribute("c", company);
        return "company/company";
	}
}
