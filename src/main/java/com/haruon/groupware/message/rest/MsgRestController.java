package com.haruon.groupware.message.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.service.MsgService;

@RestController
public class MsgRestController {
	@Autowired MsgService msgService;
	
	// 받은 편지함
	@GetMapping("/MsgReaders/{empNo}")
	public List<MsgReaderDto> getMsgReaders(@PathVariable Integer empNo, Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("empNo", userDetails.getEmpNo());
		return msgService.getMsgReaders(empNo);
	}
}
