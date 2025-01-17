package com.haruon.groupware.message.dto;

import lombok.Data;

@Data
public class MsgReaderDto { // 받은 쪽지
	private Integer msgrNo; // 받은 쪽지 번호
	private Integer msgNo; // 쪽지 번호
	private Integer empNo; // 받는 사람
	private String state; // 상태 - 안읽음/읽음
	private String readDate; // 읽은 날짜, NULL
	
	private String ename; // 발신인
	private String descript; // 발신인 직급
	private String title; // 제목
	private String content; // 내용
	private String sendDate; // 수신일
}
