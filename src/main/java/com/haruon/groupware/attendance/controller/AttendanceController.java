package com.haruon.groupware.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.attendance.service.AttendanceService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AttendanceController {
	@Autowired AttendanceService attendanceService;
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
	
	//출퇴근 등록
	@GetMapping("/employee/registerAttendance")
	public String registerAttendance(HttpSession session, RedirectAttributes ra) {
		String result = attendanceService.registerAttendance(session.getAttribute("loginEmpNo"));
		
		String registerAttendanceResult = switch(result) {
			case "시작시간등록-출장시간" -> "현재시간보다 더 이른 출장일정이 있어, 해당 시간으로 등록합니다.";
			case "시작시작등록-정상등록" -> "출근시간 등록이 정상적으로 처리되었습니다.";
			case "퇴근시간등록-정상등록" -> "퇴근시간 등록이 정상적으로 처리되었습니다.";
			case "연차-미등록" -> "금일 연차 일정이 있어, 출근등록을 정상적으로 처리하지 못하였습니다.";
			default -> null;
		};
		
		ra.addFlashAttribute("registerAttendanceResult", registerAttendanceResult);
		  
		log.debug(result);
		log.debug(registerAttendanceResult);
		return "redirect:/";
	}
	
}
