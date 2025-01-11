package com.haruon.groupware.draft.dto;

import lombok.Data;

@Data
public class ResponseVacationDraftDetail {
	private Integer draNo;
	private Integer appNo;
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
	private String subEmpName; // 대체업무자
	private String vacType; // 연차,반차
	private String vacStartDate;
	private String vacFinishDate;
	private String emergPhone;
}
