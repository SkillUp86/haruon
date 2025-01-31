package com.haruon.groupware.chat.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.chat.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatMessengerController {
	@Autowired private ChatService chatService; 
	
	// 메신저 채팅방 페이지
	@GetMapping("/room")
	public String chat(@RequestParam String id, Model model) {
		model.addAttribute("roomId", id);
		return "chat/chat";
	}
	
	// 메신저 메인 페이지
	@GetMapping("/main")
	public String chatMain() {
		return "chat/chatMain";
	}
	
	// 사원조회 후 채팅방 참가 및 생성
	@PostMapping("/room/findOrCreate")
	public String findOrCreateChatRoom(@RequestParam Integer empNo1
										, @RequestParam Integer empNo2) {
		String roomId = chatService.findOrCreateChatRoom(empNo1, empNo2);
		return "redirect:/chat/room?id=" + roomId;
	}

}
