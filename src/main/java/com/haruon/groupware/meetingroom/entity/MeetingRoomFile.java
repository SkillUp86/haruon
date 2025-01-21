package com.haruon.groupware.meetingroom.entity;

import lombok.Data;

@Data
public class MeetingRoomFile {
	private Integer meefNo;
	private Integer meeNo;
	private String originalName;
	private String fileName;
	private String kind;
	private Long size;
	private String ext;
	private String createDate;
}
