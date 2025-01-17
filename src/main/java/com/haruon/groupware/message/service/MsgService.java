package com.haruon.groupware.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.mapper.MsgMapper;

@Service
@Transactional
public class MsgService {
	@Autowired MsgMapper msgMapper;
	
	// 받은 쪽지함
	public List<MsgReaderDto> getMsgReaders(Integer empNo) {
		return msgMapper.getReaderMsgList(empNo);
	}

	// 보낸 쪽지함
	public List<MsgSenderDto> getMsgSenders(Integer empNo) {
		return msgMapper.getSenderMsgList(empNo);
	}
	
	// 임시 보관함
	public List<MsgSenderDto> getTemporaryMsgList(Integer empNo, String stateT) {
		Map<String, Object> mapT = new HashMap<>();
		mapT.put("empNo", empNo);
		mapT.put("state", stateT);
		
		return msgMapper.getTemporaryMsgList(mapT);
	}
	
}
