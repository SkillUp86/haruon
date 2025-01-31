package com.haruon.groupware.schedule.entity;

import lombok.Data;

@Data
public class Schedules {
	private Integer schNo;
	private String kind;
	private String title;
	private String content;
	private String startTime;
	private String endTime;
	private String ename;
	private Integer empNo;
	
}
