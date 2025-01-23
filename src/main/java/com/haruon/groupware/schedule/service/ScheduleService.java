package com.haruon.groupware.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;
import com.haruon.groupware.meetingroom.mapper.ReservationMapper;
import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.mapper.ScheduleMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class ScheduleService {
	
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired CommonMapper commonMapper;
	@Autowired ReservationMapper reservationMapper;
	
	public List<Schedules> schedulesList(){
		CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = userDetails.getEmpNo();
		return scheduleMapper.schedulesList();	
	}
	
	
	public int addSchedule(Schedules schedule) {
        return scheduleMapper.addSchedule(schedule);
    }
		
	public List<CommonCode> kind(String parentCode){
		return commonMapper.findByParentCode(parentCode);
		
	}
	public Integer deleteSchedule(Integer schNo) {
	    // 예약 번호 찾기
	    Integer resNo = reservationMapper.findReservationByScheduleNo(schNo);
	    
	    // 예약 번호가 있으면 삭제 처리
	    if (resNo != null) {
	        Integer reservationResult = reservationMapper.deleteReservation(resNo);
	        if (reservationResult < 1) {
	            // 예약 삭제 실패 시 예외 대신 로그 처리
	            log.debug("예약 삭제 실패: resNo " + resNo);
	        }
	    }

	    // 출석 삭제 (출석 데이터가 없는 경우에도 예외를 던지지 않고 넘어감)
	    Integer attendanceResult = scheduleMapper.deleteScheduleAttendance(schNo);
	    if (attendanceResult < 0) { 
	        // 출석 데이터가 없으면 -1일 수 있으므로
	       log.debug("출석 데이터가 없거나 삭제되지 않았습니다. schNo: " + schNo);
	    }

	    // 스케줄 삭제
	    Integer scheduleResult = scheduleMapper.deleteSchedule(schNo);
	    if (scheduleResult < 1) {
	        // 스케줄 삭제 실패 시 예외 대신 로그 처리
	       log.debug("스케줄 삭제 실패: schNo " + schNo);
	        return 0; // 삭제 실패 시 0 반환
	    }

	    return scheduleResult; // 성공 시 삭제된 스케줄의 결과 반환
	}

	public Integer updateSchedule (Schedules schedules) {
		return scheduleMapper.updateSchedule(schedules);
	}
	
	public Schedules scheduleOne (Integer schNo) {
		return scheduleMapper.scheduleOne(schNo);
	}


	
	
}
