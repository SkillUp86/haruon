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
import com.haruon.groupware.attendance.service.AttendanceService;
import com.haruon.groupware.attendance.service.DeptAttendanceService;
import com.haruon.groupware.auth.CustomUserDetails;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class DeptAttendanceRestController {
	@Autowired private AttendanceService attendanceService;
	@Autowired private DeptAttendanceService deptAttendanceService;
	
	// (부서) (월) 근태 기록(yearMonth "yyyy-MM")
	@GetMapping({"/department/attendance/{deptNo}/{yearMonth}"})
	public ResponseEntity<List<ResponseAttendanceList>> getAttendanceListByDivision(@PathVariable Integer deptNo
																					, @PathVariable String yearMonth
																					, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		if(userDetails.getDepNo().equals(deptNo)) {
			List<ResponseAttendanceList> attendanceList = deptAttendanceService
															.findDeptAttendanceListByMonth(deptNo, yearMonth);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(attendanceList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
	
	// (부서) (월) 휴가 신청 기록(yearMonth "yyyy-MM")
	@GetMapping({"/department/leaves/{deptNo}/{yearMonth}"})
	public ResponseEntity<List<ResponseLeaveList>> getDeptLeaveReqListByMonth(@PathVariable Integer deptNo
																			  , @PathVariable String yearMonth
																			  , Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		if(userDetails.getDepNo().equals(deptNo)) {
			List<ResponseLeaveList> leaveReqList = deptAttendanceService
															.findtDeptLeaveReqListByMonth(deptNo, yearMonth);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(leaveReqList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}	
	
	// 회사 유급휴가 평균 사용률(연간)
	@GetMapping("/company/leave/UsageRate")
	public ResponseEntity<Double> findCompanyLeaveUsageRateForYear() {
		Double empLeaveUsageRate = attendanceService.findLeaveUsageRateForYear(new RequestAttendanceList());
		return ResponseEntity.ok(empLeaveUsageRate);
	}
	
	// 부서 유급휴가 사용률(연간)
	@GetMapping("/department/leave/UsageRate/{deptNo}")
	public ResponseEntity<Double> findDeptLeaveUsageRateForYear(@PathVariable Integer deptNo
			 													, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		if(userDetails.getDepNo().equals(deptNo)) {
			RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
			requestAttendanceList.setDeptNo(deptNo);
			Double empLeaveUsageRate = attendanceService.findLeaveUsageRateForYear(requestAttendanceList);
			return ResponseEntity.ok(empLeaveUsageRate);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
	
	// 부서원 각각 유급휴가 사용 요약(연간) - 연차 유급휴가 사용률
	@GetMapping("/department/leaves/information/{deptNo}")
	public ResponseEntity<List<ResponseLeaveList>> findDeptLeaveUsageRateList(@PathVariable Integer deptNo
																				, Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		if(userDetails.getDepNo().equals(deptNo)) {
			RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
			requestAttendanceList.setDeptNo(deptNo);
			List<ResponseLeaveList> deptLeaveUsageRateList = attendanceService.findLeaveUsageRateList(requestAttendanceList);
			return ResponseEntity.ok(deptLeaveUsageRateList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
	
	// (부서) (월) 출장 신청 기록(yearMonth "yyyy-MM")
	@GetMapping({"/department/businessTrips/{deptNo}/{yearMonth}"})
	public ResponseEntity<List<ResponseBusinessTripList>> getDeptBusinessTripListByMonth(@PathVariable Integer deptNo
																						  , @PathVariable String yearMonth
																						  , Authentication authentication) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		if(userDetails.getDepNo().equals(deptNo)) {
			List<ResponseBusinessTripList> businessTripReqList = deptAttendanceService
															.findDeptBusinessTripReqListByMonth(deptNo, yearMonth);
			return ResponseEntity.ok(businessTripReqList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(401)).build();
		}
	}
}
