package com.haruon.groupware.message.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgReaderListDto;
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
	
	// 휴지통(받은 쪽지)
	@GetMapping("/MsgTrashs/{empNo}")
	public List<MsgReaderDto> getTrashsMsg(@PathVariable Integer empNo) {
		return msgService.getTrashsMsg(empNo);
	}
	// 휴지통 비우기
	@PostMapping("/emptyTrash/{empNo}")
	public Boolean emptyTrash(@PathVariable Integer empNo) {
	    return msgService.deleteEmptyTrash(empNo);
	}
	
	// 쪽지 읽음
	@PostMapping("/readMsg/{msgNo}")
	public Integer modifyReadState(@PathVariable Integer msgNo) {
		return msgService.modifyReadState(msgNo);
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
