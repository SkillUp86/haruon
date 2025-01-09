package com.haruon.groupware.attendance.entity;

import lombok.Data;

@Data
public class Attendance {
	private Integer empNo;		
	private String startTime;
	private String endTime;
	private String state;
	private String approvalYN;
	private String reasonMod;
	
}
