package com.haruon.groupware.company.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.company.entity.Company;
import com.haruon.groupware.company.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired CompanyService companyService;
	
	@GetMapping("/company")
	public String getCompanyInfo(Authentication authentication, Model model) {
		Company company = companyService.getCompanyInfo();
        model.addAttribute("c", company);
        
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        int depNo = userDetails.getDepNo();
        model.addAttribute("depNo",depNo);
		
        return "company/company";
	}
	
	@GetMapping("/company/modify")
	public String modifyCompanyInfo(Model model) {
		Company company = companyService.getCompanyInfo();
        model.addAttribute("c", company);
        return "company/modify";
	}
	@PostMapping("/company/modify")
	public String modifyCompanyInfo(@RequestParam String comName, @RequestParam String address, @RequestParam String leader
									, @RequestParam String phone, @RequestParam String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("comName", comName);
		map.put("address", address);
		map.put("leader", leader);
		map.put("phone", phone);
		map.put("email", email);
		companyService.modifyCompanyInfo(map);
		
		return "redirect:/company";
	}
	
}
