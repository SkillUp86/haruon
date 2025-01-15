package com.haruon.groupware.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.service.EmpUpdateService;

@Controller
public class EmpUpdateController {
	private final EmpUpdateService empUpdateService;
	
	public EmpUpdateController(EmpUpdateService empUpdateService) {
		this.empUpdateService = empUpdateService;
	}

	// 개인정보 업데이트
	@PostMapping("/update/user")
	public String updateEmp(RequestEmpUpdateInfo updateInfo) {
		// 유효성 검사
		if(!empUpdateService.isAccess(updateInfo.getEmpNo())) {
			return "login";
		}
		empUpdateService.updateEmpInfo(updateInfo);
		return "redirect:/myInfo";
	}
}
