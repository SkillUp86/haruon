package com.haruon.groupware.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.message.dto.MsgReaderListDto;
import com.haruon.groupware.message.mapper.MsgMapper;

@Service
@Transactional
public class MsgService {
	@Autowired private MsgMapper msgMapper;
	
	public List<MsgReaderListDto> findUnreadMsgSum(Integer empNo) {
		return msgMapper.findUnreadMsgSum(empNo);
	}
	
	public Integer findUnreadMsgCnt(Integer empNo) {
		return msgMapper.findUnreadMsgCnt(empNo);
	}

}
