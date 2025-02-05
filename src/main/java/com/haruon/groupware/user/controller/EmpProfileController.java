package com.haruon.groupware.user.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.service.EmpProfileService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class EmpProfileController {
	
private final EmpProfileService empProfileService;
	
	public EmpProfileController(EmpProfileService empProfileService) {
		this.empProfileService = empProfileService;
	}
	
	// 프로필 사진 업로드
	@PostMapping("/upload/profile")
	public String postMethodName(@RequestParam MultipartFile file, Authentication authentication) {
		log.debug("file = {}",file.getOriginalFilename());
		String path = "/home/ubuntu/upload/profile/";
		CustomUserDetails details = (CustomUserDetails)authentication.getPrincipal();
		String email = details.getUsername();
		log.debug("email = {}",email);
		empProfileService.profileUpload(file, email, path);
		
		return "redirect:/myInfo";
	}
	
}
