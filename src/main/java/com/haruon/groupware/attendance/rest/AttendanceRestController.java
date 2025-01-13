package com.haruon.groupware.attendance.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.attendance.dto.RequestAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseBusinessTripList;
import com.haruon.groupware.attendance.dto.ResponseLeaveList;
import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.service.AttendanceService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AttendanceRestController {
	@Autowired private AttendanceService attendanceService;
	
	// 로그인한 사람의 출근/퇴근 시간
	@GetMapping("/attendance/employee/{empNo}")
	public ResponseEntity<Attendance> getEmpAttendance(@PathVariable Integer empNo, HttpSession session) {

		if(session.getAttribute("loginEmpNo") != null) {
			Attendance attendanceByEmp = attendanceService.findAttendanceByEmp(empNo);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(attendanceByEmp);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// (부서) (월) 근태 기록(yearMonth "yyyy-MM")
	@GetMapping({"/department/attendance/{deptNo}/{yearMonth}"})
	public ResponseEntity<List<ResponseAttendanceList>> getAttendanceListByDivision(@PathVariable Integer deptNo
																			  , @PathVariable String yearMonth
																			  , HttpSession session) {
		
		if(session.getAttribute("loginEmpLocation").equals("I03") && session.getAttribute("loginEmpDept").equals(deptNo)) {
			List<ResponseAttendanceList> attendanceList = attendanceService
															.findDeptAttendanceListByMonth(deptNo, yearMonth);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(attendanceList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// (개인) (월) 근태 기록
	@GetMapping("/employee/attendance/{empNo}/{yearMonth}")
	public ResponseEntity<List<ResponseAttendanceList>> findEmpAttendanceListByMonth(@PathVariable Integer empNo
																		 , @PathVariable String yearMonth
																		 , HttpSession session) {
		if(session.getAttribute("loginEmpNo") != null) {
			List<ResponseAttendanceList> attendanceList = attendanceService
													 		.findEmpAttendanceListByMonth(empNo, yearMonth);
			log.debug(attendanceList.toString());
			return ResponseEntity.ok(attendanceList);
		} else {
			log.debug("findEmpAttendanceListByMonth");
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
		
	}
	
	// (부서) (월) 휴가 신청 기록(yearMonth "yyyy-MM")
	@GetMapping({"/department/leaves/{deptNo}/{yearMonth}"})
	public ResponseEntity<List<ResponseLeaveList>> getDeptLeaveReqListByMonth(@PathVariable Integer deptNo
																			  , @PathVariable String yearMonth
																			  , HttpSession session) {
		
		if(session.getAttribute("loginEmpLocation").equals("I03") && session.getAttribute("loginEmpDept").equals(deptNo)) {
			List<ResponseLeaveList> leaveReqList = attendanceService
															.findtDeptLeaveReqListByMonth(deptNo, yearMonth);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(leaveReqList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// (개인) (월) 휴가 신청 기록
	@GetMapping("/employee/leaves/{empNo}/{yearMonth}")
	public ResponseEntity<List<ResponseLeaveList>> getEmpLeaveReqListByMonth(@PathVariable Integer empNo
																		 , @PathVariable String yearMonth
																		 , HttpSession session) {
		if(session.getAttribute("loginEmpNo").equals(empNo)) {
			List<ResponseLeaveList> leaveReqList = attendanceService
													 		.findtEmpLeaveReqListByMonth(empNo, yearMonth);
			log.debug(leaveReqList.toString());
			return ResponseEntity.ok(leaveReqList);
		} else {
			log.debug("findEmpAttendanceListByMonth");
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
		
	}
	
	// 회사 유급휴가 평균 사용률(연간)
	@GetMapping("/company/leave/UsageRate")
	public ResponseEntity<Double> findCompanyLeaveUsageRateForYear(HttpSession session) {
		
		if(session.getAttribute("loginEmpLocation").equals("I03")) {
			Double empLeaveUsageRate = attendanceService.findLeaveUsageRateForYear(new RequestAttendanceList());
			return ResponseEntity.ok(empLeaveUsageRate);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// 부서 유급휴가 사용률(연간)
	@GetMapping("/department/leave/UsageRate/{deptNo}")
	public ResponseEntity<Double> findDeptLeaveUsageRateForYear(@PathVariable Integer deptNo, HttpSession session) {
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(deptNo);
		
		if(session.getAttribute("loginEmpLocation").equals("I03") && session.getAttribute("loginEmpDept").equals(deptNo)) {
			Double empLeaveUsageRate = attendanceService.findLeaveUsageRateForYear(requestAttendanceList);
			return ResponseEntity.ok(empLeaveUsageRate);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// 개인 유급휴가 사용률(연간)
	@GetMapping("/employee/leave/UsageRate/{empNo}")
	public ResponseEntity<Double> findEmpLeaveUsageRateForYear(@PathVariable Integer empNo, HttpSession session) {
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		
		if(session.getAttribute("loginEmpNo").equals(empNo)) {
			Double empLeaveUsageRate = attendanceService.findLeaveUsageRateForYear(requestAttendanceList);
			return ResponseEntity.ok(empLeaveUsageRate);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// (부서) (월) 출장 신청 기록(yearMonth "yyyy-MM")
	@GetMapping({"/department/businessTrips/{deptNo}/{yearMonth}"})
	public ResponseEntity<List<ResponseBusinessTripList>> getDeptBusinessTripListByMonth(@PathVariable Integer deptNo
																						  , @PathVariable String yearMonth
																						  , HttpSession session) {
		
		if(!session.getAttribute("loginEmpLocation").equals("I03") && session.getAttribute("loginEmpDept").equals(deptNo)) {
			List<ResponseBusinessTripList> businessTripReqList = attendanceService
															.findDeptBusinessTripReqListByMonth(deptNo, yearMonth);
			//log.debug(attendanceByEmp.toString());
			return ResponseEntity.ok(businessTripReqList);
		} else {
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
	}
	
	// (개인) (월) 출장 신청 기록
	@GetMapping("/employee/businessTrips/{empNo}/{yearMonth}")
	public ResponseEntity<List<ResponseBusinessTripList>> getEmpBusinessTripReqListByMonth(@PathVariable Integer empNo
																							 , @PathVariable String yearMonth
																							 , HttpSession session) {
		if(session.getAttribute("loginEmpNo").equals(empNo)) {
			List<ResponseBusinessTripList> businessTripReqList = attendanceService
													 		.findEmpBusinessTripReqListByMonth(empNo, yearMonth);
			log.debug(businessTripReqList.toString());
			return ResponseEntity.ok(businessTripReqList);
		} else {
			log.debug("findEmpAttendanceListByMonth");
			return ResponseEntity.status(HttpStatusCode.valueOf(400)).build();
		}
		
	}

}
