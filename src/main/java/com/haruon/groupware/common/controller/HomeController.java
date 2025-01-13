package com.haruon.groupware.common.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.auth.CustomUserDetails;

@Controller
public class HomeController {

	@GetMapping("/home")
	public String home(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("empNo", userDetails.getEmpNo());
		
		return "home";
	}
	
	
}
