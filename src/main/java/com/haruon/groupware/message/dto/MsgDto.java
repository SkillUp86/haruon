package com.haruon.groupware.message.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MsgDto { // 메일 발송, 임시저장
	private Integer msgNo; // 쪽지 번호
	private String title; // 쪽지 제목
	private String content; // 쪽지 내용
	
	private List<MultipartFile> msgFiles; // 쪽지 파일
}
