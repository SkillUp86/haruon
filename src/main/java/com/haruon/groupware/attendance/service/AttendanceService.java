package com.haruon.groupware.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.dto.RequestAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseLeaveList;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class AttendanceService {
	@Autowired private AttendanceMapper attendanceMapper;
	
	// 평균 유급휴가 사용률(연간) - x : 회사 평균 / empNo : 개인 평균 / deptNo : 부서 평균
	public Double findLeaveUsageRateForYear(RequestAttendanceList requestAttendanceList) {
		return attendanceMapper.findLeaveUsageRateForYear(requestAttendanceList);
	}

	// 연차 요약 및 사용률 리스트(연간) - empNo : 개인 / deptNo : 부서원
	public List<ResponseLeaveList> findLeaveUsageRateList(RequestAttendanceList requestAttendanceList) {
		return attendanceMapper.findLeaveSumAndUsageRateList(requestAttendanceList);
	}
}






