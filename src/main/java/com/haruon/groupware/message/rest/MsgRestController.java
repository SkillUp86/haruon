package com.haruon.groupware.message.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.service.MsgService;


@RestController
public class MsgRestController {
	@Autowired MsgService msgService;
	
	// 받은 쪽지함
	@GetMapping("/MsgReaders/{empNo}")
	public List<MsgReaderDto> getMsgReaders(@PathVariable Integer empNo) {
		return msgService.getMsgReaders(empNo);
	}
	
	// 보낸 쪽지함
	@GetMapping("/MsgSenders/{empNo}")
	public List<MsgSenderDto> getMsgSenders (@PathVariable Integer empNo) {
		return msgService.getMsgSenders(empNo);
	}
	
	// 임시보관함
	@GetMapping("/MsgTemporarys/{empNo}")
	public List<MsgSenderDto> getMsgTemporarys (@PathVariable Integer empNo) {
		String stateT = "E01"; // 임시보관 코드
		
		return msgService.getTemporaryMsgList(empNo, stateT);
	}
}
