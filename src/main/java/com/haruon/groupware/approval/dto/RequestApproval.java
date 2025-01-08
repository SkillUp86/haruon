package com.haruon.groupware.approval.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestApproval {
	private Integer appNo;
	private Integer draNo;
	
	private Integer empNo; // 기안자 사원번호
	private String empName;
	private Integer midAppNo;
	private Integer finalAppNo;
	private Integer refNo;
	private String kind; //(결재유형)
	private String place; //출장지역 
	private String placeStartDate;
	private String placeEndDate;
	private Integer fraNo; //가맹점 
	private String ym; //연월
	private Integer revenue; //매출액
	private String subEmpNumber; //대체업무자 사원번호
	private String vacStartDate;
	private String vacFinishDate;
	private String vactionType;
	private String urgentPhone;
	private String title;
	private String textContent;
	private List<MultipartFile> formFile;
	
}
