package com.haruon.groupware.message.service;

import java.util.List;

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
	
	public List<MsgReaderDto> getMsgReaders(Integer empNo) {
		return msgMapper.getReaderMsgList(empNo);
	}

	public List<MsgSenderDto> getMsgSenders(Integer empNo) {
		return msgMapper.getSenderMsgList(empNo);
	}
	
}
