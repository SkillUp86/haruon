package com.haruon.groupware.chat.entity;

import lombok.Data;

@Data
public class Chat {
	private String roomId;	   // FK ( chatRoom - roomNo )
	private Integer senderNo;  // FK ( emp - empNo )
	private String message;
	private String sendTime;
}
