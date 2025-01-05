package com.haruon.groupware.attendance.entity;

import lombok.Data;

@Data
public class Attendance {
	private Integer empno;		
	private String start_time;
	private String end_time;
	private String state;
	private String approvalYN;
	private String reason_mod;
	
}
