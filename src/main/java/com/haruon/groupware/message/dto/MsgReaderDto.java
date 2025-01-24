package com.haruon.groupware.message.dto;

import lombok.Data;

@Data
public class MsgReaderDto { // 받은 쪽지
	private Integer msgrNo; // 받은 쪽지 번호
	private Integer msgNo; // 쪽지 번호
	private Integer empNoR; // 수신인 사번
	private String stateR; // 수신상태 코드 - 안읽음/읽음
	private String state; // 수신상태 - 안읽음/읽음
	private String readDate; // 읽은 날짜, NULL
	
	private String enameS; // 발신인
	private String descriptS; // 발신인 직급
	private String emailS; // 발신인 메일

	private String enameR; // 수신인
	private String descriptR; // 수신인 직급
	private String emailR; // 수신인 메일
	
	private String title; // 제목
	private String content; // 내용
	private String sendDate; // 수신일
	private String fileNameE; // 발신인 파일명파일명
	private String extE; // 발신인 파일 확장자
	private String originNameM; // 첨부파일 원본이름
	private String fileNameM; // 첨부파일 DB 이름
	private String extM; // 첨부 파일 확장자
}
