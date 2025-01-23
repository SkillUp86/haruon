package com.haruon.groupware.common.controller;

import com.haruon.groupware.draft.dto.response.ResponseDraft;
import com.haruon.groupware.draft.service.DraftService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.auth.CustomUserDetails;

import java.util.List;

@Controller
public class HomeController {

	private final DraftService draftService;

	public HomeController(DraftService draftService) {
		this.draftService = draftService;
	}

	@GetMapping("/home")
	public String home(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
		model.addAttribute("empNo", empNo);
		model.addAttribute("deptNo", userDetails.getDepNo());
		// 결재함 5개
		List<ResponseDraft> draftList = draftService.getDraftListByMainPage(empNo);
		model.addAttribute("draftList", draftList);
		return "home";
	}
	
	
}
