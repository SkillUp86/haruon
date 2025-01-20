package com.haruon.groupware.chat.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.chat.dto.EmpDTO;
import com.haruon.groupware.chat.service.ChatService;
import com.haruon.groupware.user.service.EmpService;

@RestController
public class ChatRestController {
	@Autowired private EmpService empService;
	@Autowired private ChatService chatService;
	
	@GetMapping("/chat/employees")
	public ResponseEntity<List<EmpDTO>> getEmpList() {
		List<EmpDTO> empList = chatService.getEmpList();
		return ResponseEntity.ok(empList);
	}
	

}
