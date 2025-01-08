package com.haruon.groupware.draft.dto;

import lombok.Data;

@Data
public class ResponseDraft {
	private Integer draNo;
	private String draftType; // 양식타입
	private String title;
	private String content;
	private String createDate;
	private String approvalType; // 결재상태
}
