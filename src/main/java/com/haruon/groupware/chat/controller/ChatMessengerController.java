package com.haruon.groupware.chat.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.chat.service.ChatService;
import com.haruon.groupware.user.service.EmpUpdateService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatMessengerController {
	@Autowired private ChatService chatService; 
	@Autowired private EmpUpdateService empUpdateService;
	
	@GetMapping("/chat")
	public String chat() {
		return "chat/chat";
	}
	
	@GetMapping("/chat/main")
	public String chatMain() {
		return "chat/chatMain";
	}
	
	// 사원이 직접 상태 변경
	@GetMapping("/chat/connection/update")
	public String connectionUpdate(Authentication auth, @RequestParam String status) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		empUpdateService.changeConnectionInfo(userDetails.getEmpNo(), status);
		log.debug("로그인상태 변경 - {}", status);
		return "redirect:/chat/main";
	}
}
