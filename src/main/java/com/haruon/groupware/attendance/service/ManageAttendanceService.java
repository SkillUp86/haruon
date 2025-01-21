package com.haruon.groupware.attendance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

import lombok.extern.slf4j.Slf4j;
import static com.haruon.groupware.attendance.service.AttendanceServiceSupport.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@Transactional
public class ManageAttendanceService {
	@Autowired private AttendanceMapper attendanceMapper;
	@Autowired private EmpUpdateMapper empUpdateMapper;
	
	// 메인페이지 오늘 출/퇴근 시간 등록
	public String registerAttendance(Integer empNo) {
		// 현재 로그인한 사람
		
		// 현재시간 
		String nowTime = LocalDateTime
					.now(ZoneId.of("Asia/Seoul"))
					.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		// 오늘 attendance 중 startTime이 있는지 확인
		
		
		// 근태기록 update / insert parameter
		Attendance attForRegister = new Attendance();
		attForRegister.setEmpNo(empNo);
		
		if(attendanceMapper.findAttendanceByEmp(empNo) != null) {
			attForRegister.setStartTime(LocalDate.now(ZoneId.of("Asia/Seoul")).toString());
			attForRegister.setEndTime(nowTime);
			attendanceMapper.updateAttendance(attForRegister);
			return "퇴근시간등록-정상등록";
		} else {	// 오늘자 근태내용없으면
			// (0) 연차, 출장 기록 가져오기 - todaySchedules
			String today = LocalDate.now(ZoneId.of("Asia/Seoul")).toString();
			Attendance attForSearch = new Attendance();
			attForSearch.setEmpNo(Integer.parseInt(String.valueOf(empNo)));
			attForSearch.setStartTime(today);
			List<Map<String, Object>> todaySchedules = attendanceMapper.findDaySchByEmpAndDay(attForSearch);
			
			String businessTripStart = null;  // 출장 시작 시간
			
			// (1) 오늘이 [연차]라면 등록 막고, [출장]이 있다면 현재시간과 비교하여 더 이른시간으로 등록하게끔하기
			for(Map<String, Object> sch : todaySchedules) {
	        	if(sch.get("schType").equals("연차")) {
	        		return "연차-미등록";
	        	}
	        	if(sch.get("schType").equals("출장")) {
	        		if(businessTripStart != null) {
	        			log.debug("오늘 출장 기록이 2번 이상 있음");
	        			Long startInVar = parsingDate(businessTripStart);
	        			Long startInMap = parsingDate(sch.get("startTime").toString());
	        			
		        		businessTripStart = (startInVar > startInMap)? sch.get("startTime").toString() : businessTripStart;
	        		} else {
	        			businessTripStart = sch.get("startTime").toString();
	        		}
	        	}
			}
			
			String startTimeForRegister;
			
			if(businessTripStart != null) {
				if(calculateHours(nowTime, businessTripStart) < 0) {
					startTimeForRegister = businessTripStart;
					attForRegister.setStartTime(startTimeForRegister);
					attendanceMapper.createAttendance(attForRegister);
					return "시작시간등록-출장시간";
				}
			} 
			
			startTimeForRegister = nowTime;
			attForRegister.setStartTime(startTimeForRegister);
			attendanceMapper.createAttendance(attForRegister);
			return "시작시작등록-정상등록";
		}
	}
	
	// 근태 승인여부 변경 approvalYN modify - 1
	public Integer modifyApprovalYN(List<String> modifyTargets) {
		int predictedExecuteCnt = modifyTargets.size();
		int actualExecuteCnt = 0;
		Attendance att = null;
		
		for(String target : modifyTargets) {
			String[] targetArr = target.split(" ");
			att = new Attendance();
			att.setEmpNo(Integer.parseInt(targetArr[0]));
			att.setStartTime(targetArr[1]);
			att.setApprovalYN("Y");
			log.debug(att.toString());
			
			actualExecuteCnt += attendanceMapper.updateAttendance(att);
		}
		
		if(predictedExecuteCnt == actualExecuteCnt) {
			return -1;
		} 
		
		Integer failResult = predictedExecuteCnt - actualExecuteCnt;
		log.debug("AttendanceService - modifyAttendancies 에러 :state값이 Null인 행이 있음");
		log.debug("update되지 않은 건수 = " + failResult);
		return failResult;
	}

	// 근태 상태 변경
	public Integer modifyState(String modifyTargets, String state) {
		Attendance att = null;
		
		String[] targetArr = modifyTargets.split(" ");
		att = new Attendance();
		att.setEmpNo(Integer.parseInt(targetArr[0]));
		att.setStartTime(targetArr[1]);
		att.setState(state);
		log.debug(att.toString());
			
		return attendanceMapper.updateAttendance(att);
	}

	// 총 연차 수정
	public Integer updateTotalLeaveByDivision(EmpEntity emp) {
		return empUpdateMapper.updateTotalLeaveByDivision(emp);
	}

}
