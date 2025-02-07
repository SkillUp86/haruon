package com.haruon.groupware.approval.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.dto.ResponseBusinessTrip;
import com.haruon.groupware.approval.dto.ResponseVacation;
import com.haruon.groupware.approval.entity.ApprovalEntity;
import com.haruon.groupware.user.entity.EmpEntity;

@Mapper
public interface ApprovalActionMapper {
	// 중간 결재자 승인
	int updateMidApproval(int draNo);

	// 최종 결재자 승인
	int updateFinalApproval(int draNo);

	// 사인 이미지 존재확인
	int findSignByEmpNo(int empNo);

	// 일정 추가용 출장결재 데이터 뽑기
	ResponseBusinessTrip findByBusinessTrip(int draNo);

	// 일정 추가용 휴가결재 데이터 뽑기
	ResponseVacation findByVacation(int draNo);

	// 휴가 연차 갯수 가져오기
	int findTotalLeave(int empNo);

	// 휴가 연차 차감
	int updateTotalLeave(int empNo, int leaveDay);

	// 유효성 검사 1
	ApprovalEntity findMidApprovalByEmpNo(int empNo, int draNo);

	// 유효성 검사 2
	ApprovalEntity findFinalApprovalByEmpNo(int empNo, int draNo);

	// 반려사유 유효성 검사
	EmpEntity findRejectByEmpNo(int empNo, int draNo);

	// 반려사유 입력
	int saveRejectDescript(int draNo, String reasonDenial);

	int findUsedLeave(int empNo);


}
