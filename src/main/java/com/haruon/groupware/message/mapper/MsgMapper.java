package com.haruon.groupware.message.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;

@Mapper
public interface MsgMapper {
	
	
	// 받은 쪽지함
	List<MsgReaderDto> getReaderMsgList(Integer empNo);

	// 보낸 쪽지
	List<MsgSenderDto> getSenderMsgList(Integer empNo);
	
	// 임시 보관함
	List<MsgSenderDto> getTemporaryMsgList(Map<String, Object> mapT);
}
