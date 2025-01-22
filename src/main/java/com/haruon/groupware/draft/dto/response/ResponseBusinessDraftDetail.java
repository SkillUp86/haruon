package com.haruon.groupware.draft.dto.response;

import lombok.Data;

@Data
public class ResponseBusinessDraftDetail {
	private Integer draNo;
	private Integer empNo;
	private Integer appNo;
	private String type;
	private String draftType;
	private String drafterNo;
	private String drafterName;
	private String location;
	private Integer depNo;
	private String deptName;
	private String midApp; // 양식타입
	private String midAppName;
	private String finApp;
	private String finalAppName;
	private String referEmpNo; // 결재상태
	private String referName;
	private String title;
	private String content;
	private String place;
	private String bizStartDate;
	private String bizFinishDate;
	private String createDate;
	private String midDate;
	private String finalDate;
	private String state;
	private String approvalState;
	private String midFilename;
	private String midFileExt;
	private String finalFilename;
	private String finalFileExt;
	private String reasonDenial;
}
