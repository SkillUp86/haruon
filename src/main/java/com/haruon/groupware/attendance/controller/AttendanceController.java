package com.haruon.groupware.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendanceController {
	// 개인 근태/연가/출장 관리 페이지
	@GetMapping("/employee/attendance")
	public String attendanceEmp() {
		return "/attendance/attendanceEmp";
	}
	// 부서 근태/연가/출장 관리 페이지
	@GetMapping("/employees/attendance")
	public String attendanceDivision() {
		return "/attendance/attendanceDivision";
	}
}
