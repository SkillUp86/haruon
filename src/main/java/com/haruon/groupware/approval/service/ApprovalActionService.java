package com.haruon.groupware.approval.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.entity.ApprovalEntity;
import com.haruon.groupware.approval.mapper.ApprovalActionMapper;
import com.haruon.groupware.auth.CustomUserDetails;

@Transactional
@Service
public class ApprovalActionService {

	private final ApprovalActionMapper approvalActionMapper;
	
	public ApprovalActionService(ApprovalActionMapper approvalActionMapper) {
		this.approvalActionMapper = approvalActionMapper;
	}
	// 반려사유 입력
	public int getRejectDescription(ApprovalEntity approvalEntity) {
		return approvalActionMapper.saveRejectDescript(approvalEntity);
	}
	
	// 중간 유효성 검사
	public boolean isAccessBymidApproval(int draNo) {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		Integer midApp = approvalActionMapper.findMidApprovalByEmpNo(empNo, draNo).getMidApp();
		//Integer finalApp = approvalActionMapper.findFinalApprovalByEmpNo(empNo).getFinalApp(); 
		// 중간결재자가 아닐시 접근제한
		if(empNo == midApp) {
			return true;
		}
		return false;
	}
	// 최종 유효성 검사
	public boolean isAccessByFinalApproval(int draNo) {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		//Integer midApp = approvalActionMapper.findMidApprovalByEmpNo(empNo).getMidApp();
		Integer finalApp = approvalActionMapper.findFinalApprovalByEmpNo(empNo, draNo).getFinalApp();
		// 중간결재자가 아닐시 접근제한
		if(empNo == finalApp) {
			return true;
		}
		return false;
	}
	// 반려사유 권한이 있는지 확인
	public boolean isAccessByRejectApproval(int draNo) {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		
		Integer rejectByEmpNo = approvalActionMapper.findRejectByEmpNo(empNo, draNo).getEmpNo();
		if(empNo == rejectByEmpNo) {
			return true;
		}
		return false;
	}
	
	// 결재자 사인이미지 유무
	public int getFindSignByEmpNo() {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return approvalActionMapper.findSignByEmpNo(details.getEmpNo());
	}
	// 최종 결재자 사인
	public int getUpdateFinalApproval(int draNo) {
		return approvalActionMapper.updateFinalApproval(draNo);
	}
	// 중간 결재자 사인
	public int getUpdateMidApproval(int draNo) {
		return approvalActionMapper.updateMidApproval(draNo);
	}
}
