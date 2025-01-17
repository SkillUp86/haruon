package com.haruon.groupware.message.dto;

import lombok.Data;

@Data
public class MsgSenderDto { // 보낸쪽지함
	private Integer msgsNo; // 보낸 쪽지 번호
	private Integer msgNo; // 쪽지 번호
	private Integer empNo; // 발신인
	private String state; // 발신 상태 - 발신, 임시
	private String sendDate; // 발신일
	
	private String ename; // 수신인
	private String descriptR; // 수신인 직급
	private String tite; // 제목
	private String content; // 내용
	private String descript; // 발신 상태
	
}
