package com.haruon.groupware.attendance.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.attendance.dto.RequestAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseBusinessTripList;
import com.haruon.groupware.attendance.dto.ResponseLeaveList;
import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.service.AttendanceService;
import com.haruon.groupware.attendance.service.EmpAttendanceService;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.auth.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class EmpAttendanceRestController {
	@Autowired private AttendanceService attendanceService;
	@Autowired private EmpAttendanceService empAttendanceService;
	
	// 로그인한 사람의 출근/퇴근 시간
	@GetMapping("/attendance/employee/{empNo}")
	public ResponseEntity<Attendance> getEmpAttendance(@PathVariable Integer empNo
														, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		if(userDetails.getEmpNo().equals(empNo)) {
			Attendance attendanceByEmp = empAttendanceService.findAttendanceByEmp(empNo);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(attendanceByEmp);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
	
	// (개인) (월) 근태 기록
	@GetMapping("/employee/attendance/{empNo}/{yearMonth}")
	public ResponseEntity<List<ResponseAttendanceList>> findEmpAttendanceListByMonth(@PathVariable Integer empNo
																					, @PathVariable String yearMonth
																					, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		if(userDetails.getEmpNo().equals(empNo)) {
			List<ResponseAttendanceList> attendanceList = empAttendanceService
													 		.findEmpAttendanceListByMonth(empNo, yearMonth);
			log.debug(attendanceList.toString());
			return ResponseEntity.ok(attendanceList);
		} else {
			log.debug("findEmpAttendanceListByMonth");
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
		
	}
	

	// (개인) (월) 휴가 신청 기록
	@GetMapping("/employee/leaves/{empNo}/{yearMonth}")
	public ResponseEntity<List<ResponseLeaveList>> getEmpLeaveReqListByMonth(@PathVariable Integer empNo
																		 	, @PathVariable String yearMonth
																		 	, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		if(userDetails.getEmpNo().equals(empNo)) {
			List<ResponseLeaveList> leaveReqList = empAttendanceService
													 		.findtEmpLeaveReqListByMonth(empNo, yearMonth);
			log.debug(leaveReqList.toString());
			return ResponseEntity.ok(leaveReqList);
		} else {
			log.debug("findEmpAttendanceListByMonth");
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
		
	}
	
	// 개인 유급휴가 사용률(연간)
	@GetMapping("/employee/leave/UsageRate/{empNo}")
	public ResponseEntity<Double> findEmpLeaveUsageRateForYear(@PathVariable Integer empNo
																, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		if(userDetails.getEmpNo().equals(empNo)) {
			RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
			requestAttendanceList.setEmpNo(empNo);
			Double empLeaveUsageRate = attendanceService.findLeaveUsageRateForYear(requestAttendanceList);
			return ResponseEntity.ok(empLeaveUsageRate);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
	
	// 개인 유급휴가 사용 요약(연간) - 연차 유급휴가 사용률
	@GetMapping("/employee/leave/sum/{empNo}")
	public ResponseEntity<List<ResponseLeaveList>> findEmpLeaveUsageRateList(@PathVariable Integer empNo
																				, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		if(userDetails.getEmpNo().equals(empNo)) {
			RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
			requestAttendanceList.setEmpNo(empNo);
			List<ResponseLeaveList> deptLeaveUsageRateList = attendanceService.findLeaveUsageRateList(requestAttendanceList);
			return ResponseEntity.ok(deptLeaveUsageRateList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
	
	// (개인) (월) 출장 신청 기록
	@GetMapping("/employee/businessTrips/{empNo}/{yearMonth}")
	public ResponseEntity<List<ResponseBusinessTripList>> getEmpBusinessTripReqListByMonth(@PathVariable Integer empNo
																							 , @PathVariable String yearMonth
																							 , Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		if(userDetails.getEmpNo().equals(empNo)) {
			List<ResponseBusinessTripList> businessTripReqList = empAttendanceService
													 		.findEmpBusinessTripReqListByMonth(empNo, yearMonth);
			log.debug(businessTripReqList.toString());
			return ResponseEntity.ok(businessTripReqList);
		} else {
			log.debug("findEmpAttendanceListByMonth");
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
		
	}

}

