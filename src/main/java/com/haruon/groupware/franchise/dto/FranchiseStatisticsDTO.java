package com.haruon.groupware.franchise.dto;

import lombok.Data;

@Data
public class FranchiseStatisticsDTO {
	// 가맹점 등록건수
	private Integer thisYearRegisterCnt;
	private Integer thisMonthRegisterCnt;
	private Integer totalRegisterCnt;
	
	// 가맹점 운영여부
	private Integer opendCnt;
	private Integer closedCnt;
	
	// 가맹점별 매출
	private Integer fraNo;
	private String fName;
	private Integer revenue;
	private String month;
	

}
