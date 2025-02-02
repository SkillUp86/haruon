package com.haruon.groupware.message.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MsgDto { // 쪽지 발송, 임시저장
	private Integer msgNo; // 쪽지 번호
	private String title; // 쪽지 제목
	private String content; // 쪽지 내용
	
	private Integer empNoS; // 발신인 사번
	private String stateS; // 발신상태 - 발송, 임시저장
	private String enameS; // 발신인 이름
	private String emailS; // 발신인 메일
	private String sendDate; // 발신일
	
	private Integer empNoR; // 수신인 사번
	private String enameR; // 수신인 이름
	private String emailR; // 수신인 메일
	private String stateR; // 수신상태 - 읽지않음, 읽음
	
	private List<MultipartFile> msgFiles; // 쪽지 파일
}
