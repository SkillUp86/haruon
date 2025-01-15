package com.haruon.groupware.attendance.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.haruon.groupware.auth.CustomUserDetails;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AttendanceController {
	
	// 개인 근태/연가/출장 관리 페이지
	@GetMapping("/employee/attendance")
	public String attendanceEmp(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("empNo", userDetails.getEmpNo());
		return "attendance/attendanceEmp";
	}
	// 부서 근태/연가/출장 관리 페이지
	@GetMapping("/department/attendance")
	public String attendanceDivision(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("depNo", userDetails.getDepNo());
		return "attendance/attendanceDivision";
	}
	

	
}
