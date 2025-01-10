package com.haruon.groupware.draft.dto;

import lombok.Data;

@Data
public class ResponseDraftDetail {
	private Integer draNo;
	private String draftType;
	private String location;
	private Integer depNo;
	private String deptName;
	private String midApp; // 양식타입
	private String midAppName;
	private String finApp;
	private String finalAppName;
	private String referEmpNo; // 결재상태
	private String referName;
	private String drafterNo;
	private String drafterName;
	private String title;
	private String content;
	private String createDate;
	private String midDate;
	private String finalDate;
	private String approvalState;
}
