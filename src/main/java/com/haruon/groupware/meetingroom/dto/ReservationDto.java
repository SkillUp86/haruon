package com.haruon.groupware.meetingroom.dto;


import lombok.Data;

@Data
public class ReservationDto {
	private Integer resNo;
	private Integer meeNo;
	private Integer schNo;
	private Integer empNo;
	private String revDate;
	private String revTime;
	private String content;
	private String bookDate;
}
