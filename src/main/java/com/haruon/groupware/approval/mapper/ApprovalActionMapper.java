package com.haruon.groupware.approval.mapper;

import org.apache.ibatis.annotations.Mapper;

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
	
	// 유효성 검사
	ApprovalEntity findMidApprovalByEmpNo(int empNo, int draNo);
	ApprovalEntity findFinalApprovalByEmpNo(int empNo, int draNo);
	// 반려사유 유효성 검사
	EmpEntity findRejectByEmpNo(int empNo, int draNo);
	// 반려사유 입력
	int saveRejectDescript(ApprovalEntity approvalEntity);
}
