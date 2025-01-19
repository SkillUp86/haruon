package com.haruon.groupware.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.GetMapping;
>>>>>>> 57a3f040a3d2839a7966e769d74197dacdb2e1e4
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
<<<<<<< HEAD
import com.haruon.groupware.user.entity.EmpEntity;
=======
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.service.EmpService;
>>>>>>> 57a3f040a3d2839a7966e769d74197dacdb2e1e4
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
	

	// 비밀번호 찾기 처리
	@PostMapping("/findPw")
	public String findPw(EmpEntity empEntity, Model model) {
		try {
			empUpdateService.findAndSendNewPw(empEntity);
			model.addAttribute("message", "새로운 비밀번호가 이메일로 발송되었습니다.");
			return "user/login";
		} catch (IllegalArgumentException e) {
			model.addAttribute("message", e.getMessage());
		} catch (Exception e) {
			model.addAttribute("message", "오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "user/findPw";
	}
	// 직원 정보 수정
	@GetMapping("/employees/modify")
	public String modifyEmpInfo(@RequestParam Integer empNo, Model model) {
		ResponseEmpInfo empInfo = empService.findByEmpInfo(empNo);
		model.addAttribute("e",empInfo);
		
		return "dept/modify";
	}
}
