package com.haruon.groupware.attendance.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AttendanceService {
	@Autowired private AttendanceMapper attendanceMapper;
	@Autowired private EmpMapper empMapper;
	
	// 하루 전
	private LocalDate yesterdayLD
					= LocalDate.now(ZoneId.of("Asia/Seoul")).minusDays(1);
	private String yesterday = yesterdayLD.toString();
	
	// 하루 전이 속한 달의 1일 
	private String listTargetStart = LocalDate.of(yesterdayLD.getYear(), yesterdayLD.getMonthValue(), 1).toString();
	
	
	@Scheduled(cron = "00 00 00 * * *")
	public void schedulePreviousDayAttState() throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 1) 퇴사일자가 null인 모든 직원 리스트 가져오기 - 스케쥴링 대상
		List<Emp> empList = empMapper.findAllEmp();
		
		Attendance yesterDayAtt = new Attendance(); // 특정 직원의 어제자 근태 데이터 행
		Attendance newAtt = new Attendance();	// 갱신된 attendance 인스턴스
		List<Map<String, Object>> findVacationAtt = new ArrayList<>(); // 어제의 사원의 연차/출장 기록
		
		// 2) (전날 + 특정 직원)으로 attendance테이블에 행이 있는지 판단 - 있으면 해당행을 update 하고, 없으면 해당행을 insert 하고
		loopOut :
		for(Emp emp : empList) {
			yesterDayAtt.setEmpno(emp.getEmpNo());
			yesterDayAtt.setStart_time(yesterday);
			
			
			yesterDayAtt = attendanceMapper.findAttendance(yesterDayAtt);
	        findVacationAtt = attendanceMapper.findYesterDayAttByEmpAndDay(yesterDayAtt);
			
			if(yesterDayAtt != null) {
				
		        Date workStartTime = dateFormat.parse(yesterDayAtt.getStart_time());
		        Date workEndTime = dateFormat.parse(yesterDayAtt.getEnd_time());

		        // 근무시간(workHour) 확인
		        Integer workHour = (int)((workStartTime.getTime() - workEndTime.getTime()) / 1000 / 60 / 60 );
		        
		        // 근무시간 별 근태 기록 업데이트 + 생성
		        if(workHour < 5) {
		        	
		        } else if (workHour < 9) {
		        	
		        } else {
		        	
		        }
		        
			} else {
				
				// 연차인지 확인
				for(Map<String, Object> sch : findVacationAtt) {
		        	if(sch.get("schType").equals("연차")) {
		        		newAtt.setEmpno(emp.getEmpNo());
		        		newAtt.setStart_time(yesterday + " 00:00:00");
		        		newAtt.setEnd_time(yesterday + " 23:59:59");
		        		newAtt.setState("연차");
		        		continue loopOut;
		        	}
	        	}
			}
			
			
		}
		
		
		// 3) 결과 확인
		 	
	}
}






