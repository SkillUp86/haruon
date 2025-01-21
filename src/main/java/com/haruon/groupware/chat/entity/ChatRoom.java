package com.haruon.groupware.chat.entity;

import lombok.Data;

@Data
public class ChatRoom {
	private String roomId;	// 
	private Integer empNo;	// FK 해당 방 참여자 null 허용
}
