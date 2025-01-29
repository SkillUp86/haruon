package com.haruon.groupware.meetingroom.dto;

import lombok.Data;

@Data
public class RequestReservationDto {
	private String content;
	private String revTime;
	private String revDate;
	private String attendees;
		
	
}
