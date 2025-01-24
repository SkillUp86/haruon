package com.haruon.groupware.message.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.message.dto.MsgDto;
import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgReaderListDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.entity.MsgFile;

@Mapper
public interface MsgMapper {
	
	
	// 쪽지 작성
	Integer insertMsg(MsgDto msgDto); 
	Integer insertMsgFile(MsgFile msgFile);
	Integer insertSenderMsg(MsgDto msgDto);
	Integer insertReaderMsg(MsgDto msgDto);
	
	// 받은 쪽지함
	List<MsgReaderDto> getReadersMsgList(Integer empNo);
	Integer modifyReadState(Integer msgNo); // 읽음 상태변경
	
	// 받은 쪽지
	MsgReaderDto getReaderMsg(Integer msgNo);
	List<MsgFile> getMsgFileList(Integer msgNo);

	// 보낸 쪽지
	List<MsgSenderDto> getSenderMsgList(Integer empNo);
	
	// 임시 보관함
	List<MsgSenderDto> getTemporaryMsgList(Integer empNo);
	
	// Header에 표시할 읽지 않은 상태인 수신쪽지관련 정보요약
	List<MsgReaderListDto> findUnreadMsgSum(Integer empNo);
	
	// Header에 표시할 읽지 않은 상태인 수신쪽지의 수
	Integer findUnreadMsgCnt(Integer empNo);

}
