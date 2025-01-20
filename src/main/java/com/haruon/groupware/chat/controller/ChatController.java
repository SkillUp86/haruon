package com.haruon.groupware.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public String chat() {
		return "chat/chat";
	}
	@GetMapping("/employies/chat")
	public String employiesChat() {
		return "chat/empList";
	}

}
