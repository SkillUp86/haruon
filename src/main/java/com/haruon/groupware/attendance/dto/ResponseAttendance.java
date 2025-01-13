package com.haruon.groupware.attendance.dto;

import lombok.Getter;

@Getter
public class ResponseAttendance {
	private String state;
	private String approvalYN;
	private String startTime;
	private String endTime;

}

