package com.haruon.groupware.attendance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.haruon.groupware.attendance.service.ManageAttendanceService;
import com.haruon.groupware.auth.CustomUserDetails;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ManageAttendanceContoller {
	@Autowired private ManageAttendanceService editAttendanceService;
	
	// 출퇴근 등록
	@GetMapping("/employee/registerAttendance/result")
	@ResponseBody
	public String registerAttendance(Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		String result = editAttendanceService.registerAttendance(userDetails.getEmpNo());
		
		String registerAttendanceResult = switch(result) {
			case "시작시간등록-출장시간" -> "현재시간보다 더 이른 출장일정이 있어, 해당 시간으로 등록합니다.";
			case "시작시작등록-정상등록" -> "출근시간 등록이 정상적으로 처리되었습니다.";
			case "퇴근시간등록-정상등록" -> "퇴근시간 등록이 정상적으로 처리되었습니다.";
			case "연차-미등록" -> "금일 연차 일정이 있어, 출근등록을 정상적으로 처리하지 못하였습니다.";
			default -> null;
		};
		
		log.debug(result);
		log.debug(registerAttendanceResult);
		return registerAttendanceResult;
	}
	
	
	
}
