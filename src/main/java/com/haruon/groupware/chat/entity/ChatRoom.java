package com.haruon.groupware.chat.entity;

import java.util.UUID;

import lombok.Data;

@Data
public class ChatRoom {
	private String roomId;	// 
	private Integer empNo;	// FK 해당 방 참여자 null 허용
	
	public static ChatRoom createRoomId() {
		ChatRoom room = new ChatRoom();
		room.setRoomId(UUID.randomUUID().toString());
		return room;
	}
}
