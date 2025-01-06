package com.haruon.groupware.meetingroom.entity;

import lombok.Data;

@Data
public class MeetingRoom {
	private Integer schNo;
	private String kind;
	private String title;
	private String content;
	private String startTime;
	private String endTime;
}
