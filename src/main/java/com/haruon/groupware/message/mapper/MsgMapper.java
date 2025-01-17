package com.haruon.groupware.message.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.message.dto.MsgReaderListDto;

@Mapper
public interface MsgMapper {
	
	// Header에 표시할 읽지 않은 상태인 수신쪽지관련 정보요약
	List<MsgReaderListDto> findUnreadMsgSum(Integer empNo);
	
	// Header에 표시할 읽지 않은 상태인 수신쪽지의 수
	Integer findUnreadMsgCnt(Integer empNo);

}
