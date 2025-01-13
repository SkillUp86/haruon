package com.haruon.groupware.attendance.dto;


import com.haruon.groupware.attendance.entity.Attendance;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 클라이언트의 요청/반환을 위해 DTO를 사용하고, 
// 저장하는 부분과 같이 DB 관련 부분에서는 Entity를 사용

// Attendance Resgistry 변동사항이 있는 요청이 있을 시, 응답 값을 controller에서 view로 전달하기 위해 사용하는 ResponseDTO. 

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED) // 기본 생성자 값 주입 방지 + MyBatis는 리플렉션을 사용한 객체를 생성하기 위함
public class ResponseAttendance {
	private String state;
	private String approvalYN;
	private String startTime;
	private String endTime;
	
	// DTO -> Entity로 변환 (Service Layer에서 변환)
	@Builder
	public ResponseAttendance(Attendance attendance) {
		this.approvalYN = attendance.getApprovalYN();
		this.state = attendance.getState();
		this.startTime = attendance.getStartTime();
		this.endTime = attendance.getEndTime();
	}
}


//@AllArgsConstructor(access = AccessLevel.PROTECTED)
// MyBatis에서는 보통 모든 필드를 초기화하는 생성자를 명시적으로 호출하지 않음 - JPA 이야기
// 리플렉션은 클래스에 정의된 기본 생성자를 찾고 이를 호출하여 객체를 생성합니다. 