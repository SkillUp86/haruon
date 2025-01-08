package com.haruon.groupware.attendance.dto;


import java.util.List;

import lombok.Data;

// 근태 컬럼 수정을 위한 DTO
@Data
public class ModAttendanceDto {
	// 수정 대상 조건 : 사원번호 + attendance 테이블의 start_time 컬럼
	private List<Integer> empno;		
	private List<String> start_time;
	
	// 수정 대상 : state(근태 유형), reason_mod(수정 사유), approvalYN(승인여부)
	private String state;
	private String reason_mod;
	private String approvalYN;
}
