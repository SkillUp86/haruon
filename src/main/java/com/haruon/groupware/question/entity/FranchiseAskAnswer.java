package com.haruon.groupware.question.entity;

import lombok.Data;

@Data
public class FranchiseAskAnswer {
	private Integer fraAnswerNo;
	private Integer fraAskNo;
	private Integer empNo;
	private String content;
	private String createDate;
}
