package com.haruon.groupware.attendance.dto;

import lombok.Getter;
import lombok.Setter;

// 출장 리스트 조회시, Registry Layer에서 view Layer까지 전달하는 ResponseDTO

@Getter
@Setter
public class ResponseBusinessTripList {
	private String empName;			// 사원의 이름
	private String role;		// 사원의 직급 (common_code의 descript)
	private String startTime;		// 출장 시작시간
	private String endTime;			// 출장 종료시간
	private String place;			// 출장 장소
	private String approvalState;	// 출장신청서 결재 상태 (common_code의 descript)
	private Integer draNo;			// 출장신청서 기안문서번호
}
