package com.haruon.groupware.attendance.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Attendance {
	private Integer empNo;		
	private String startTime;
	private String endTime;
	private String state;
	private String approvalYN;
	private String reasonMod;
	
}
