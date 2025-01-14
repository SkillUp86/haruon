package com.haruon.groupware.question.dto;

import lombok.Data;

@Data
public class AnswerDto {
	private Integer fraAnswerNo;
	private Integer fraAskNo;
	private Integer empNo;
	private String ename;
	private String content;
	private String createDate;
}
