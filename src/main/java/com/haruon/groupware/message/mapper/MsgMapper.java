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

	// 임시저장 쪽지 발송
	Integer modifyMsg(MsgDto msgDto);
	
	// 쪽지 작성
	Integer insertMsg(MsgDto msgDto); 
	Integer insertMsgFile(MsgFile msgFile);
	Integer insertSenderMsg(MsgDto msgDto);
	Integer insertReaderMsg(MsgDto msgDto);
	
	// 첨부파일
	List<MsgFile> getMsgFileList(Integer msgNo);

	// 받은 쪽지함
	List<MsgReaderDto> getReadersMsg(Integer empNo);
	Integer modifyReadState(Integer msgNo); // 읽음 상태변경
	Integer insertTrashMsg(Integer msgNo); // 휴지통으로 이동
	Integer deleteMsg(Integer msgNo); // 영구 삭제
	
	// 휴지통(받은 쪽지)
	List<MsgReaderDto> getTrashsMsg(Integer empNo);

	// 보낸 쪽지함
	List<MsgSenderDto> getSendersMsg(Integer empNo);
	
	// 임시 보관함
	List<MsgSenderDto> getTemporaryMsgList(Integer empNo);
	
	// Header에 표시할 읽지 않은 상태인 수신쪽지관련 정보요약
	List<MsgReaderListDto> findUnreadMsgSum(Integer empNo);
	
	// Header에 표시할 읽지 않은 상태인 수신쪽지의 수
	Integer findUnreadMsgCnt(Integer empNo);

}
