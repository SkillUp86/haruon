package com.haruon.groupware.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.service.EmpService;
import com.haruon.groupware.user.service.EmpUpdateService;

@Controller
public class EmpUpdateController {
	@Autowired EmpService empService;
	@Autowired DeptService deptService;
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
		List<Dept> deptList = deptService.findByAll();
		model.addAttribute("deptList",deptList);
		ResponseEmpInfo empInfo = empService.findByEmpInfo(empNo);
		model.addAttribute("e",empInfo);
		
		return "dept/modify";
	}
	@PostMapping("/employees/modify")
	public String modifyEmpInfo(RequestEmpUpdateInfo updateInfo
								, @RequestParam Integer empNo, @RequestParam Integer depNo
								, @RequestParam String location, @RequestParam String extNum) {
		updateInfo.setEmpNo(empNo);
		updateInfo.setDepNo(depNo);
		updateInfo.setLocation(location);
		updateInfo.setExtNum(extNum);
		empUpdateService.updateEmpBySystem(updateInfo);
		
		return "redirect:/employees/modify?empNo="+empNo;
	}
	
	// 직원 퇴사
	@PostMapping("/employees/leave")
	public String leave(@RequestParam Integer empNo, @RequestParam String leaveDate) {
		RequestEmpUpdateInfo updateInfo = new RequestEmpUpdateInfo();
		updateInfo.setEmpNo(empNo);
		updateInfo.setLeaveDate(leaveDate);
		empUpdateService.updateLeaveDate(updateInfo);
		return "redirect:/employees/modify?empNo="+empNo;
	}
}
