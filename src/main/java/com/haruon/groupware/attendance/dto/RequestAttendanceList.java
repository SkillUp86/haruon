package com.haruon.groupware.attendance.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 근태/출장/유급휴가 리스트 조회조건에 사용하는 RequestDTO

@Getter
@Setter
@ToString
public class RequestAttendanceList {
	private Integer empNo;	// 사원번호
	private Integer deptNo;	// 부서번호
    private String to;		// 조회 시작일자
    private String from;	// 조회 종료일자
}

