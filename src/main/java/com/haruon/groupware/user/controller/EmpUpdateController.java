package com.haruon.groupware.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.service.EmpService;
import com.haruon.groupware.user.service.EmpUpdateService;

@Controller
public class EmpUpdateController {
	@Autowired EmpService empService;
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
	
	// 직원 정보 수정
	@GetMapping("/employees/modify")
	public String modifyEmpInfo(@RequestParam Integer empNo, Model model) {
		ResponseEmpInfo empInfo = empService.findByEmpInfo(empNo);
		model.addAttribute("e",empInfo);
		
		return "dept/modify";
	}
}
