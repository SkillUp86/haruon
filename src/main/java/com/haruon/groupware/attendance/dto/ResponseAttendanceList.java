package com.haruon.groupware.attendance.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 근태 리스트 조회시, Registry Layer에서 view Layer까지 전달하는 ResponseDTO

@Getter
@Setter
@ToString
public class ResponseAttendanceList {
	private String empNo;		// 사원번호
	private String dName;		// 부서번호
	private String empName;		// 사원명
	private String location;	// 사원의 직급 (common_code의 descript)
	private String startTime;	// 근태 시작시간
	private String endTime;		// 근태 종료시간
	private String state;		// 근태 상태 (common_code의 descript)
	private String approvalYN;	// 근태 승인 상태 (Y또는 N)
}
