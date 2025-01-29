package com.haruon.groupware.meetingroom.dto;

import lombok.Data;

@Data
public class MyReservationDto {
	private Integer resNo;	
	private Integer meeNo;
	private Integer schNo;
	private String mname;
	private String revDate;
	private String revTime;
	private String descript;
	private String content;
	private String ename;
	
}
