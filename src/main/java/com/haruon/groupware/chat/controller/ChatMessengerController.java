package com.haruon.groupware.chat.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.chat.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatMessengerController {
	@Autowired private ChatService chatService; 
	
	
	@GetMapping("/chat/room")
	public String chat(@RequestParam String id, Model model) {
		model.addAttribute("roomId", id);
		return "chat/chat";
	}
	
	@GetMapping("/chat/main")
	public String chatMain() {
		return "chat/chatMain";
	}
	

}
