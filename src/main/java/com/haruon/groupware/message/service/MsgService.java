package com.haruon.groupware.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.entity.MsgFile;
import com.haruon.groupware.message.mapper.MsgMapper;

@Service
@Transactional
public class MsgService {
	@Autowired MsgMapper msgMapper;
	
	// 받은 쪽지함
	public List<MsgReaderDto> getReadersMsg(Integer empNo) {
		return msgMapper.getReadersMsgList(empNo);
	}
	
	// 받은 쪽지
	public MsgReaderDto getReaderMsg(Integer msgNo) {
		msgMapper.modifyReadState(msgNo); // 읽음
		return msgMapper.getReaderMsg(msgNo);
	}
	
	// 쪽지 파일
	public List<MsgFile> getMsgFileList(Integer msgNo) {
		return msgMapper.getMsgFileList(msgNo);
	}

	// 보낸 쪽지함
	public List<MsgSenderDto> getSendersMsg(Integer empNo) {
		return msgMapper.getSenderMsgList(empNo);
	}
	
//	// 임시 보관함
//	public List<MsgSenderDto> getTemporaryMsgList(Integer empNo, String stateT) {
//		Map<String, Object> mapT = new HashMap<>();
//		mapT.put("empNo", empNo);
//		mapT.put("state", stateT);
//		
//		return msgMapper.getTemporaryMsgList(mapT);
//	}
	
}
