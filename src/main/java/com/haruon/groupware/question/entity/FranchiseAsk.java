package com.haruon.groupware.question.entity;

import lombok.Data;

@Data
public class FranchiseAsk {
	private Integer fraAskNo;
	private Integer fraNo;
	private String title;
	private String content;
	private String replyYn;
	private String createDate;
}
