package com.haruon.groupware.draft.dto.response;

import lombok.Data;

@Data
public class ResponseVacationDraftDetail {
	private Integer draNo;
	private Integer empNo;
	private Integer appNo;
	private String type;
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
	private String state;
	private String approvalState;
	private Integer subEmpNo; // 대체업무자 사원번호
	private String subEmpName; // 대체업무자
	private String subEmpDept; // 대체업무자 부서
	private String kind; // 연차,반차 코드
	private String vacType; // 연차,반차 이름
	private String vacStartDate;
	private String vacFinishDate;
	private String emergPhone;
	private String midFilename;
	private String midFileExt;
	private String finalFilename;
	private String finalFileExt;
	private String reasonDenial;
}
