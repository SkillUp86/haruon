package com.haruon.groupware.message.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MsgSenderDto { // 보낸쪽지함, 임시보관함
	private Integer msgsNo; // 보낸 쪽지 번호
	private Integer msgNo; // 쪽지 번호
	private Integer empNo; // 발신인 번호
	private String state; // 발신상태 - 임시저장, 발송
	private String sendDate; // 발신일
	
	private String enameS; // 발신인
	private String descriptS; // 발신인 직급
	private String emailS; // 발신인 메일
	private String enameR; // 수신인
	private String descriptR; // 수신인 직급
	private String emailR; // 수신인 메일
	
	private String title; // 제목
	private String content; // 내용
	private String fileNameE; // 직원 사진 이름
	private String extE; // 직원 사진 확장자
	private String originNameM; // 첨부 파일 이름
	private String extM; // 첨부 파일 확장자
	
}
