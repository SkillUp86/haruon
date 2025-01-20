package com.haruon.groupware.chat.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.chat.service.ChatService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.EmpListDTO;
import com.haruon.groupware.user.service.EmpService;

@RestController
public class ChatRestController {
	@Autowired private EmpService empService;
	
	@GetMapping("/chat/employees")
	public ResponseEntity<List<EmpDto>> getEmpList() {
		List<EmpDto> empList = empService.getEmpList();
		return ResponseEntity.ok(empList);
	}
	

}
