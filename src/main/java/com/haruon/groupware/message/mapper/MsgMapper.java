package com.haruon.groupware.message.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;

@Mapper
public interface MsgMapper {
	
	
	// 받은 쪽지함
	List<MsgReaderDto> getReaderMsgList(Integer empNo);

	// 보낸 쪽지함
	List<MsgSenderDto> getSenderMsgList(Integer empNo);
}
