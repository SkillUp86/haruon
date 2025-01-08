package com.haruon.groupware.attendance.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import com.haruon.groupware.user.entity.Emp;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AttendanceService {
	@Autowired AttendanceMapper attendanceMapper;
	

	
	@Scheduled(cron = "00 00 00 * * *")
	public void schedulePreviousDayAttState() {
		// 1) 퇴사일자가 null인 1모든 직원 리스트 가져오기 
		
		// 2) 전날 + 특정 직원의 
		// 2) attedance DB 필터링 : emp_no와 start_time을 기준으로 state가 null인 경우 : insert대상 // null이 아니면 update대상 
		
	}
}






