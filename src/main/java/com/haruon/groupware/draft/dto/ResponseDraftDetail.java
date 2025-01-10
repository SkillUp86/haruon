package com.haruon.groupware.draft.dto;

import lombok.Data;

@Data
public class ResponseDraftDetail {
	// 공통 반환값
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
	
	// 출장결재 값
	private String place;
	private String bizStartDate;
	private String bizFinishDate;
	// 매출결재 값
	private Integer franchiseNo;
	private String franchiseName;
	private String ym;
    private Long revenue;
    // 휴가결재 값	
    
    private String subEmpName; // 대체업무자
    private String vacType; // 연차,반차
    private String vacStartDate;
	private String vacFinishDate;
	private String emergPhone;
}
