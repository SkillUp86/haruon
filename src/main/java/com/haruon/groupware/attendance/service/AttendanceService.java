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
	private LocalDate yesterdayLD = LocalDate.now(ZoneId.of("Asia/Seoul")).minusDays(1);
	private String yesterday = yesterdayLD.toString();
	// 하루 전이 속한 달의 1일 
	private String listTargetStart = LocalDate.of(yesterdayLD.getYear(), yesterdayLD.getMonthValue(), 1).toString();

	// 시간 비교 및 연산을 위한 DateTime 포맷팅 형식
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	// DB에서 가져온 두 시간 간격 계산
	private Integer calculateHours(String startTime, String endTime) throws ParseException {
		return (int) ( (dateFormat.parse(endTime).getTime() - dateFormat.parse(startTime).getTime()) / 1000 / 60 / 60);
	}
	
	
	@Scheduled(cron = "00 58 23 * * *")
	public void schedulePreviousDayAttState() throws ParseException {
		
		// 1) 퇴사일자가 null인 모든 직원 리스트 가져오기 - 스케쥴링 대상
		List<Emp> empList = empMapper.findAllEmp();
		
		Attendance yesterDayAtt = new Attendance(); // 특정 직원의 어제자 근태 데이터 행
		Attendance newAtt = new Attendance();	// 갱신된 attendance 인스턴스
		List<Map<String, Object>> findVacationAtt = new ArrayList<>(); // 어제의 사원의 연차/출장 기록
		
		// 2) (전날 + 특정 직원)으로 attendance테이블에 행이 있는지 판단 - 있으면 해당행을 update 하고, 없으면 해당행을 insert 하고
		loopOut :
		for(Emp emp : empList) {
	        Integer halfDayOffTime = 0;		  // 반가 시간
	        String businessTripStart = null;  // 출장 시작 시간
	        String businessTripEnd = null;	  // 출장 마친 시간
			
			yesterDayAtt.setEmpNo(emp.getEmpNo());
			yesterDayAtt.setStartTime(yesterday);
			
			
			yesterDayAtt = attendanceMapper.findAttendance(yesterDayAtt);	// 어제자 근태 기록
	        findVacationAtt = attendanceMapper.findYesterDayAttByEmpAndDay(yesterDayAtt);	// 어제자 연차/출장 기록
	        log.debug("3");
	        
	        newAtt.setEmpNo(emp.getEmpNo());

	        for(Map<String, Object> sch : findVacationAtt) {
	        	// 어제가 연차라면 행등록하고 다음 직원 근태 스케쥴링으로 넘어간다.
	        	if(sch.get("schType").equals("연차")) {
	        		newAtt.setStartTime(yesterday + " 00:00:00");
	        		newAtt.setEndTime(yesterday + " 23:59:59");
	        		newAtt.setState("연차");
	        		attendanceMapper.insertAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 연차 등록 insert");
	        		continue loopOut;
	        	} 
	        	
	        	// 어제가 반차라면 근태시간 체크시 반차 시간 산입 및 반차에 대한 행 추가
	        	if(sch.get("schType").equals("반차")) {
	        		halfDayOffTime = calculateHours(sch.get("startTime").toString(), sch.get("endTime").toString());
	        		newAtt.setStartTime(sch.get("startTime").toString());
	        		newAtt.setEndTime(sch.get("endTime").toString());
	        		newAtt.setState("반차");
	        		attendanceMapper.insertAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 반차 등록 insert");
	        	}
	        	
	        	// 어제 중 출장을 다녀왔으면 출장기록을 변수에 담는데, 출장이 여러번이라면 start는 더 이른시간으로 end는 더 늦은 시간을 기록한다.
	        	if(sch.get("schType").equals("출장")) {
	        		if(businessTripStart != null || businessTripEnd != null) {
	        			Long startInVar = dateFormat.parse(businessTripStart).getTime();
	        			Long endInVar = dateFormat.parse(businessTripEnd).getTime();
	        			Long startInMap = dateFormat.parse(sch.get("startTime").toString()).getTime();
	        			Long endInMap = dateFormat.parse(sch.get("endTime").toString()).getTime();
	        			
		        		businessTripStart = (startInVar > startInMap)? sch.get("startTime").toString() : businessTripStart;
		        		businessTripEnd = (endInVar > endInMap)? businessTripEnd : sch.get("endTime").toString();
	        		} else {
	        			businessTripStart = sch.get("startTime").toString();
	        			businessTripEnd = sch.get("endTime").toString();
	        		}
	        	}
        	}
	        
			// 근무시간(workHour) 확인
			int workHour = 0; // 출장시간을 고려한 출퇴근 기간 
			Integer attHour = workHour + halfDayOffTime;	// 근태상태 판단기준 시간 = 출퇴근(출장시간) + 반가시간
			
			if(yesterDayAtt != null) { // 출근버튼이라도 찍었을 경우
				newAtt.setStartTime(yesterday);
				
		        if(yesterDayAtt.getEndTime() != null) {
		        	// 어제자 근태기록에 출, 퇴근 시간 찍혀있을 경우
		        	workHour = calculateHours(yesterDayAtt.getStartTime(), yesterDayAtt.getEndTime());
		        } else if (businessTripEnd != null) {
		        	// 어제자 근태기록에 퇴근 시간은 없지만, 출장 기록이 있는 경우
		        	workHour = calculateHours(yesterDayAtt.getStartTime(), businessTripEnd);
		        } else {
		        	// 어제자 근태기록에 퇴근 시간과 출장 기록 둘 다 없는 경우 : 결근으로 처리 후 다음 멤버 근태 관리 스케쥴링
	        		newAtt.setEndTime(yesterday + " 23:59:59");
		        	newAtt.setState("결근");
	        		attendanceMapper.updateAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 결근 등록 update");
	        		continue;
		        }
		        
		        attHour = workHour + halfDayOffTime;	
		        
		        // 근무시간 별 근태 기록 업데이트 + 생성
		        if(attHour < 5) {
		        	// 결근으로 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("결근");
		        } else if (attHour < 9) {
		        	// 조퇴 및 지각으로 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("조퇴및지각");
		        } else {
		        	// 정상근무 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("정상근무");
		        }
		        
		        attendanceMapper.updateAttendance(newAtt);
		        log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 인스턴스가 이미 있는 경우, 근태시각 파악 및 update");
		        
			} else {	// 출근버튼도 누르지 않았을 경우
				if(businessTripStart != null && businessTripEnd != null) {	// 출장기록이 있는 경우
					workHour = calculateHours(businessTripStart, businessTripEnd);
					attHour = workHour + halfDayOffTime;
					newAtt.setStartTime(businessTripStart);
	        		newAtt.setEndTime(businessTripEnd);
	        		
					if(attHour < 5) {
			        	// 결근으로 등록
		        		newAtt.setState("결근");
			        } else if (attHour < 9) {
			        	// 조퇴 및 지각으로 등록
		        		newAtt.setState("조퇴및지각");
			        } else {
			        	// 정상근무 등록
		        		newAtt.setState("정상근무");
			        }
				} else {
					newAtt.setStartTime(yesterday + " 23:59:59");
	        		newAtt.setEndTime(yesterday + " 23:59:59");
		        	newAtt.setState("결근");
				}
				
				attendanceMapper.insertAttendance(newAtt);
				log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 인스턴스가 없는 경우, 근태시각 파악 및 insert");
			}
		}
		 	
	}
}






