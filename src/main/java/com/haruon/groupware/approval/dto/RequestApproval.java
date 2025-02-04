package com.haruon.groupware.approval.dto;

import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestApproval {
	private Integer appNo;
	private Integer draNo;
	// 공통
	@NotBlank(message = "제목은 필수입니다.")
	private String title;
	@NotBlank(message = "내용은 필수입니다.")
	private String textContent;
	private List<MultipartFile> formFile;
	@NotNull(message = "사원번호는 필수입니다.")
	private Integer empNo; // 기안자 사원번호
	private String empName;
	private Integer midAppNo;
	@NotNull(message = "최종결재자 선택은 필수입니다.")
	private Integer finalAppNo;
	private Integer refNo;
	@NotBlank(message = "문서 유형은 필수입니다.")
	private String kind; //(결재유형)

	//출장
	private String place; //출장지역 
	private String placeStartDate;
	private String placeEndDate;

	// 가맹점
	private Integer fraNo; //가맹점 
	private String ym; //연월
	private Integer revenue; //매출액
	// 휴가
	private String subEmpNumber; //대체업무자 사원 전화번호
	private String vacStartDate;
	private String vacFinishDate;
	private String vacationType;
	private String urgentPhone;

	
}
