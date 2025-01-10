package com.haruon.groupware.common.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.attendance.dto.ResponseAttendance;
import com.haruon.groupware.attendance.service.AttendanceService;
import com.haruon.groupware.common.dto.ResponseDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class HomeRestController {
	@Autowired private AttendanceService attendanceService;
	
	// 로그인한 사람의 출근/퇴근 시간
	@GetMapping("/attendance/employee/{empNo}")
	public ResponseEntity<ResponseAttendance> attendance(@PathVariable Integer empNo, HttpSession session) {

		if(session.getAttribute("empNo") == null) {
			ResponseAttendance attendanceByEmp = attendanceService.findAttendanceByEmp(empNo);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(attendanceByEmp);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
}
