package com.haruon.groupware.message.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.service.MsgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MsgRestController {
	@Autowired MsgService msgService;
	
	// 받은 쪽지함
	@GetMapping("/MsgReaders/{empNo}")
	public List<MsgReaderDto> getReadersMsg(@PathVariable Integer empNo) {
		return msgService.getReadersMsg(empNo);
	}
	
	// 받은 쪽지
	@GetMapping("/MsgReader/{msgNo}")
	public MsgReaderDto getReaderMsg(@PathVariable Integer msgNo) {
		log.debug("msgNo =====>" + msgNo);
		return msgService.getReaderMsg(msgNo);
	}
	
	
	// 보낸 쪽지함
	@GetMapping("/MsgSenders/{empNo}")
	public List<MsgSenderDto> getMsgSenders (@PathVariable Integer empNo) {
		return msgService.getSendersMsg(empNo);
	}
	
	// 임시보관함
	@GetMapping("/MsgTemporarys/{empNo}")
	public List<MsgSenderDto> getMsgTemporarys (@PathVariable Integer empNo) {
		return msgService.getTemporaryMsgList(empNo);
	}
}
