package com.haruon.groupware.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import com.haruon.groupware.chat.entity.Chat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatMessageController {
//	
//	private final SimpMessageSendingOperations messagingTemplate;
//	
//	public ChatMessageController(SimpMessageSendingOperations messagingTemplate) {
//		this.messagingTemplate = messagingTemplate;
//	}
//
//	// 채팅 메세지 전달 
//	@MessageMapping("/chat/message")
//	public void message(Chat chat) {
//		messagingTemplate.convertAndSend("/sub/chat/room" + chat.getRoomId(), chat);
//	}
	
}
