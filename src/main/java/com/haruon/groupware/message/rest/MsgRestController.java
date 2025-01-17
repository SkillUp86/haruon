package com.haruon.groupware.message.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.haruon.groupware.message.dto.MsgReaderListDto;
import com.haruon.groupware.message.service.MsgService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MsgRestController {
	@Autowired private MsgService msgService;
	
	// Header 에서 수신하지 않은 메세지 리스트
	@GetMapping("/user/{empNo}/messagies/unread")
	public ResponseEntity<List<MsgReaderListDto>> getUserMessageUnread(@PathVariable Integer empNo) {
		List<MsgReaderListDto> UnreadMsgSum = msgService.findUnreadMsgSum(empNo);
		return ResponseEntity.ok(UnreadMsgSum);
	}
	
	// Header 에서 수신하지 않은 메세지의 수
	@GetMapping("/user/{empNo}/messageCount/unread")
	public ResponseEntity<Integer> getUserMessageCountUnread(@PathVariable Integer empNo) {
		return ResponseEntity.ok(msgService.findUnreadMsgCnt(empNo));
	}

}
