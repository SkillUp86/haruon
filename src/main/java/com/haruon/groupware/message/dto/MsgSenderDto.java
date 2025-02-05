package com.haruon.groupware.message.dto;


import lombok.Data;

@Data
public class MsgSenderDto { // 보낸쪽지함, 임시보관함
	private Integer msgsNo; // 보낸 쪽지 번호
	private Integer msgNo; // 쪽지 번호
	private Integer empNo; // 발신인 번호
	private String state; // 발신상태 - 임시저장, 발송
	private String sendDate; // 발신일
	
	private Integer empNoS; // 발신인 번호
	private String enameS; // 발신인
	private String descriptS; // 발신인 직급
	private String emailS; // 발신인 메일
	private Integer empNoR; // 수신인 번호
	private String enameR; // 수신인
	private String descriptR; // 수신인 직급
	private String emailR; // 수신인 메일
	
	private String title; // 제목
	private String content; // 내용
	private String fileNameE; // 수신인 파일명
	private String extE; // 수신인 파일 확장자
//	private List<MsgFileDto> msgFileDtoList;
	private String originNameM; // 첨부파일 원본이름
	private String fileNameM; // 첨부파일 DB 이름
	private String extM; // 첨부 파일 확장자
	
}
