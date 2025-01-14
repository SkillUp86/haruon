package com.haruon.groupware.question.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuestionDto {
	private Integer fraAskNo;
	private Integer fraNo;
	private String fname;
	private String title;
	private String content;
	private String replyYn;
	private String createDate;
	private List<MultipartFile> educationFile;
}
