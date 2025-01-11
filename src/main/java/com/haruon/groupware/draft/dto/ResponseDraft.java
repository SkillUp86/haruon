package com.haruon.groupware.draft.dto;

import lombok.Data;

@Data
public class ResponseDraft {
	private Integer draNo;
	private Integer appNo;
	private String kind;
	private String draftType; // 양식타입
	private String title;
	private String content;
	private String createDate;
	private String approvalState; // 결재상태
}
