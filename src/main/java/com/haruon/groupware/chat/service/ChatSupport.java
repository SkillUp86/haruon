package com.haruon.groupware.chat.service;

import java.util.UUID;

import com.haruon.groupware.chat.entity.ChatRoom;

public class ChatSupport {
	
	public static ChatRoom createRoomId() {
		ChatRoom room = new ChatRoom();
		room.setRoomId(UUID.randomUUID().toString());
		return room;
	}

}
