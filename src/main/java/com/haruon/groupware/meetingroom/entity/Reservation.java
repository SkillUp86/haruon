package com.haruon.groupware.meetingroom.entity;

import lombok.Data;

@Data
public class Reservation {
	private Integer resNo;
	private Integer meeNo;
	private Integer schNo;
	private Integer empNo;
	private Integer startTime;
	private String endTime;
	private String kind;
	private String bookDate;
}
