package com.haruon.groupware.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.entity.MsgFile;
import com.haruon.groupware.message.service.MsgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MsgController {
	@Autowired MsgService msgService;
	
	// 받은 쪽지함
	@GetMapping("/readersMsg")
	public String getReadersMsg(Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();

		List<MsgReaderDto> msgReaderList = msgService.getReadersMsg(empNo);
		model.addAttribute("msgReaderList", msgReaderList);
		
		log.debug("msgReaderList ======> " + msgReaderList);
		return "msg/readersMsg";
	}

	// 받은 쪽지
	@GetMapping("/readerMsg/{msgNo}")
	public String getReaderMsg(@PathVariable Integer msgNo, Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		
		MsgReaderDto msgReaderDto = msgService.getReaderMsg(msgNo);
		List<MsgFile> msgFileList = msgService.getMsgFileList(msgNo);
		model.addAttribute("mr", msgReaderDto);
		model.addAttribute("mfl", msgFileList);
		log.debug("msgReaderDto =====> " + msgReaderDto);
		
		return "msg/readerMsg";
	}
	
	// 보낸 쪽지함
	@GetMapping("/sendersMsg")
	public String getSendersMsg(Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		
		List<MsgSenderDto> sendersMsgDto = msgService.getSendersMsg(empNo);
		model.addAttribute("sendersMsgDto", sendersMsgDto);

		return "msg/sendersMsg";
	}
	
}
