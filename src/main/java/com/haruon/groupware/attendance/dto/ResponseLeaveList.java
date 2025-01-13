package com.haruon.groupware.attendance.dto;

import lombok.Getter;
import lombok.Setter;

//연가 리스트, 연가요약, 연가 사용률 조회시, Registry Layer에서 view Layer까지 전달하는 ResponseDTO
@Getter
@Setter
public class ResponseLeaveList {
	private Integer empNo;			// 사원 번호
	private Integer deptNo;			// 부서 번호
	
	private String eName;			// 사원명
	private String location;		// 사원 직급 (common_code의 descript)
	
	private String startTime;		// 휴가 시작시간
	private String endTime;			// 휴가 종료시간
	
	private String draNo;			// 휴가신청서 기안문서번호
	private String approvalState;	// 휴가신청서 결재상태 (common_code의 descript)
	
	private String substituteEmp;	// 휴가신청서에 기재된 대체근무자
	
	private Integer totalLeave;		// 총 연차수
	private Integer usedLeve;		// 사용한 연차수
	
	private String YearsOfService;	// 근속기간
}
