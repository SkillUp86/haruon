package com.haruon.groupware.message.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.entity.MsgFile;

@Mapper
public interface MsgMapper {
	
	
	// 받은 쪽지함
	List<MsgReaderDto> getReadersMsgList(Integer empNo);
	// 받은 쪽지
	MsgReaderDto getReaderMsg(Integer msgNo);
	List<MsgFile> getMsgFileList(Integer msgNo);
	
	// 읽음 상태변경
	Integer modifyReadState(Integer msgNo);

	// 보낸 쪽지
	List<MsgSenderDto> getSenderMsgList(Integer empNo);
	
//	// 임시 보관함
//	List<MsgSenderDto> getTemporaryMsgList(Map<String, Object> mapT);
}
