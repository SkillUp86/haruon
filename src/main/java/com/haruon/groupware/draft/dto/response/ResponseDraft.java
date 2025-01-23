package com.haruon.groupware.draft.dto.response;

import lombok.Data;

@Data
public class ResponseDraft {
	private Integer draNo;
	private Integer empNo;
	private Integer appNo;
	private String type;
	private String draftType; // 양식타입
	private String title;
	private String createDate;
	private String approvalState; // 결재상태
}
