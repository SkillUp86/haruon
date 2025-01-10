package com.haruon.groupware.attendance.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ResponseAttendance {
	// 근태 시간
	private String attendanceStartTime;
	private String attendanceEndTime;
	// 연/반차 시간
	private String dayOffStartTime;
	private String dayOffEndTime;
	// 출장 시간
	private String businessTripStartTime;
	private String businessTripEndTime;
}
