package com.haruon.groupware.message.dto;

import lombok.Data;

@Data
public class MsgReaderListDto {
	private String readerNo;	// 수신자 사원 번호
	private String senderName;	// 발신자 이름
	private String senderProfileName;	// 발신자 프로필 파일명
	private String senderProfileExt;	// 발신자 프로필 확장자명
	private Integer msgNo;
	private String sendDate;
	private String title;
}
