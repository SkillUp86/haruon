package com.haruon.groupware.meetingroom.entity;

import lombok.Data;

@Data
public class Reservation {
	private Integer resNo;
	private Integer meeNo;
	private Integer schNo;
	private Integer empNo;
	private String revDate;
	private String revTime;
	private String content;
	private String bookDate;
}
