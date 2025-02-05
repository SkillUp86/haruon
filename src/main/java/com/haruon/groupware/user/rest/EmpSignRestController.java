package com.haruon.groupware.user.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.user.service.EmpSignService;

import jakarta.servlet.http.HttpSession;

@RestController
public class EmpSignRestController {
	private final EmpSignService empSignService;
	
	public EmpSignRestController(EmpSignService empSignService) {
		this.empSignService = empSignService;
	}

	@PostMapping("/saveSign")
	public ResponseEntity<String> saveSign(@RequestParam String sign) {
		String path = "/home/ubuntu/upload/sign/";
		boolean saveSign = empSignService.saveSign(sign, path);
		if(saveSign) {
			return ResponseEntity.ok("사인 저장 성공");
		}
		return  ResponseEntity.ok("사인 저장 실패");
	}
	
}
