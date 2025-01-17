package com.haruon.groupware.meetingroom.entity;

import lombok.Data;

@Data
public class MeetingRoom {
	private Integer meeNo;
	private String mname;
	private Integer capacity;
	private String info;
	private String availYn;
	private String createDate;
	private String updateDate;
}
