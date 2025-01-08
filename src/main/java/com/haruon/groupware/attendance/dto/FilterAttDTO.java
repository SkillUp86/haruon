package com.haruon.groupware.attendance.dto;

import java.time.LocalDate;
import java.time.ZoneId;

import lombok.Data;

// attendance 관련 조회시 쿼리 조건 필터를 위한 DTO

@Data
public class FilterAttDTO {
	// 월별 리스트 날짜 조회 기준 = 전 날이 속한 달의 1일 ~ 전 날
	private LocalDate target
				= LocalDate.now(ZoneId.of("Asia/Seoul")).minusDays(1);
	
	private String beginDate
				= LocalDate.of(target.getYear(), target.getMonthValue(), 1).toString();;
	private String endDate
				= target.toString();
	
	// 조회조건 : 사원번호 or 부서번호
	private Integer empNo;
	private Integer deptNo;
	
	
	// 캡슐화
	private LocalDate getTarget() {
		return target;
	}
	
	private LocalDate setTarget() {
		return target;
	}
	
	private void setTarget(LocalDate target) {
		this.target = target;
	}
	
	private void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	
	private void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}


