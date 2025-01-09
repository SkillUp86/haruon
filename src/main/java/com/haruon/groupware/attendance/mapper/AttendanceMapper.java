package com.haruon.groupware.attendance.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.attendance.entity.Attendance;


@Mapper
public interface AttendanceMapper {
	
	// 특정 사원의 어제 근태 기록 가져오기
	Attendance findAttendance(Attendance attendance);
	// 특정 사원의 어제 연차/반차/출장 기록 가져오기 
	List<Map<String, Object>> findYesterDayAttByEmpAndDay(Attendance attendance);
	// 1. Insert 대상인지 update 대상인지 파악
	// 1-1. 특정 일 & 직원의 근태상태, 연가유무 및 시작 ~ 종료시작, 출장유무 및 시작 ~ 종료시간 조회
	// 1-2. 1. 행이 없다면, 특정 일 & 직원의 출장 및 연가 기록
	
	// 근태 업데이트 (수정대상 : 종료시간, 상태, 승인여부, 수정사유) (필요 조건값 : empNo. startDate)
	Integer updateAttendance(Attendance attendance);
	// 근태 생성 (컬럼 : emp_no, start_time, end_time, state) 
	Integer insertAttendance(Attendance attendance);
}
