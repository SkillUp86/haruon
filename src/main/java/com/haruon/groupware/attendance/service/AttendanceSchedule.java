package com.haruon.groupware.attendance.service;
import static com.haruon.groupware.attendance.service.AttendanceServiceSupport.calculateHours;
import static com.haruon.groupware.attendance.service.AttendanceServiceSupport.parsingDate;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AttendanceSchedule {
	@Autowired private AttendanceMapper attendanceMapper;
	@Autowired private EmpMapper empMapper;
	
	// 전날 전 직원 attendance 데이터 업데이트
	@Scheduled(cron = "00 00 00 * * *")
	public void schedulePreviousDayAttState() {
		String yesterday = (LocalDate.now(ZoneId.of("Asia/Seoul")).minusDays(1)).toString();
		
		// 1) 퇴사일자가 null인 모든 직원 리스트 가져오기 - 스케쥴링 대상
		List<EmpEntity> empList = empMapper.findAllEmp();
		
		Attendance yesterDayAtt = null;
		Attendance newAtt = null;	// 갱신된 attendance 인스턴스
		List<Map<String, Object>> findVacationAtt = new ArrayList<>(); // 어제의 사원의 연차/출장 기록
		
		// 2) (전날 + 특정 직원)으로 attendance테이블에 행이 있는지 판단 - 있으면 해당행을 update 하고, 없으면 해당행을 insert 하고
		loopOut :
		for(EmpEntity emp : empList) {
			log.debug("'" + emp.getEmpNo() + "'번 사원의 근태스케쥴링 결과");
			yesterDayAtt = new Attendance(); // 특정 직원의 어제자 근태 데이터 행
			newAtt = new Attendance();	// 갱신된 attendance 인스턴스
			
	        Integer halfDayOffTime = 0;		  // 반가 시간
	        String businessTripStart = null;  // 출장 시작 시간
	        String businessTripEnd = null;	  // 출장 마친 시간
			
			yesterDayAtt.setEmpNo(emp.getEmpNo());
			yesterDayAtt.setStartTime(yesterday);
			findVacationAtt = attendanceMapper.findDaySchByEmpAndDay(yesterDayAtt);	// 어제자 연차/출장 기록
			
			yesterDayAtt = attendanceMapper.findAttendance(yesterDayAtt);	// 어제자 근태 기록
	        
	        newAtt.setEmpNo(emp.getEmpNo());
	
	        for(Map<String, Object> sch : findVacationAtt) {
	        	log.debug("{} 의 스케쥴 객체 = {}", emp.getEmpNo(), sch.toString()); 
	        	
	        	// 어제가 연차라면 행등록하고 다음 직원 근태 스케쥴링으로 넘어간다.
	        	if(sch.get("schType").equals("G02")) {
	        		log.debug("어제 연차기록이 있어 연차 등록함.");
	        		newAtt.setStartTime(yesterday + " 00:00:00");
	        		newAtt.setEndTime(yesterday + " 23:59:59");
	        		newAtt.setState("B02");
	        		attendanceMapper.createAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 연차 등록 insert");
	        		continue loopOut;
	        	} 
	        	
	        	// 어제가 반차라면 근태시간 체크시 반차 시간 산입 및 반차에 대한 행 추가
	        	if(sch.get("schType").equals("G05")) {
	        		log.debug("어제 반차기록이 있어 반차기록을 추가함");
	        		halfDayOffTime = calculateHours(sch.get("startTime").toString(), sch.get("endTime").toString());
	        		newAtt.setStartTime(sch.get("startTime").toString());
	        		newAtt.setEndTime(sch.get("endTime").toString());
	        		newAtt.setState("B03");
	        		attendanceMapper.createAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 반차 등록 insert");
	        	}
	        	
	        	// 어제 중 출장을 다녀왔으면 출장기록을 변수에 담는데, 출장이 여러번이라면 start는 더 이른시간으로 end는 더 늦은 시간을 기록한다.
	        	if(sch.get("schType").equals("G03")) {
	        		log.debug("어제 출장 기록 있음");
	        		if(businessTripStart != null || businessTripEnd != null) {
	        			log.debug("어제 출장 기록이 2번 이상 있음");
	        			Long startInVar = parsingDate(businessTripStart);
	        			Long endInVar = parsingDate(businessTripEnd); 
	        			Long startInMap = parsingDate(sch.get("startTime").toString());
	        			Long endInMap = parsingDate(sch.get("endTime").toString()); 
	        			
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
			Integer attHour = workHour + halfDayOffTime;	// 근태상태 판단기준 시간 = 출퇴근(출장시간 고려) + 반가시간
			
			if(yesterDayAtt != null) { // 출근버튼이라도 찍었을 경우
				log.debug("이미 대상 attendance 행이 있음");
				newAtt.setStartTime(yesterday);
				
		        if(yesterDayAtt.getEndTime() != null) {
		        	// 어제자 근태기록에 출, 퇴근 시간 찍혀있을 경우
		        	workHour = calculateHours(yesterDayAtt.getStartTime(), yesterDayAtt.getEndTime());
		        	log.debug("출퇴근 기록있음");
		        } else if (businessTripEnd != null) {
		        	// 어제자 근태기록에 퇴근 시간은 없지만, 출장 기록이 있는 경우
		        	workHour = calculateHours(yesterDayAtt.getStartTime(), businessTripEnd);
		        	yesterDayAtt.setEndTime(businessTripEnd);
		        	log.debug("출근기록있음 + 어제자 퇴근기록 없음, 출장종료시간으로 퇴근시간 대체");
		        } else {
		        	// 어제자 근태기록에 퇴근 시간과 출장 기록 둘 다 없는 경우 : 결근으로 처리 후 다음 멤버 근태 관리 스케쥴링
	        		newAtt.setEndTime(yesterday + " 23:59:59");
		        	newAtt.setState("B04");
		        	
	        		attendanceMapper.updateAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "출근기록있음 + 어제자 퇴근/출장 기록 없음 - 결근 등록 update");
	        		continue;
		        }
		        
		        attHour = workHour + halfDayOffTime;	
		        
		        // 근무시간 별 근태 기록 업데이트 + 생성
		        if(attHour < 5) {
		        	// 결근으로 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("B04");
		        } else if (attHour < 9) {
		        	// 조퇴 및 지각으로 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("B06");
		        } else {
		        	// 정상근무 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("B01");
		        }
	        	log.debug("newAtt 객체 = " + newAtt.toString());
		        attendanceMapper.updateAttendance(newAtt);
		        log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 인스턴스가 이미 있는 경우, 근태시각 파악 및 update");
		        
			} else {	// 출근버튼도 누르지 않았을 경우
				log.debug("attendance 행 없음");
				log.debug("businessTripStart = " + businessTripStart + "businessTripEnd" + businessTripEnd);
				
				
				if(businessTripStart != null && businessTripEnd != null) {	// 출장기록이 있는 경우
					workHour = calculateHours(businessTripStart, businessTripEnd);	
					log.debug("businessTripStart = {}", businessTripStart);
					log.debug("businessTripEnd = {}", businessTripEnd);
					log.debug("workHour = {}", workHour);
					attHour = workHour + halfDayOffTime;
					newAtt.setStartTime(businessTripStart);
	        		newAtt.setEndTime(businessTripEnd);
	        		
	        		log.debug("인스턴스 없음, 출장시간과 종료 시간으로 근무시간 기록");
	        		
					if(attHour < 5) {
			        	// 결근으로 등록
		        		newAtt.setState("B04");
			        } else if (attHour < 9) {
			        	// 조퇴 및 지각으로 등록
		        		newAtt.setState("B06");
			        } else {
			        	// 정상근무 등록
		        		newAtt.setState("B01");
			        }
				} else {
					newAtt.setStartTime(yesterday + " 23:59:59");
	        		newAtt.setEndTime(yesterday + " 23:59:59");
		        	newAtt.setState("B04");
				}
				log.debug("전날 인스턴스가 없는 경우, insert 객체 = " + newAtt.toString());
				attendanceMapper.createAttendance(newAtt);
				log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 인스턴스가 없는 경우, 근태시각 파악 및 insert");
			}
		}
	}

}
