package com.haruon.groupware.user.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.user.entity.EmpFile;
import com.haruon.groupware.user.service.EmpProfileService;

import jakarta.servlet.http.HttpSession;

@RestController
public class EmpRestController {
	
	private final EmpProfileService empProfileService;
	
	public EmpRestController(EmpProfileService empProfileService) {
		this.empProfileService = empProfileService;
	}

	@PostMapping("/mypage/uploadProfile")
	public String uploadProfile(@RequestParam MultipartFile file, @RequestParam int empNo, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadProfile/");
		int profileUpload = empProfileService.profileUpload(file, empNo, path);
		if (profileUpload == 1) {
			return "성공";
		}
		return "실패";
	}
	
	@GetMapping("/mypage/profileImage")
	public ResponseEntity<EmpFile> getprofileImage(@RequestParam int empNo) {
		EmpFile profileByUser = empProfileService.getProfileByUser(empNo);
		return ResponseEntity.ok(profileByUser);
	}

}
