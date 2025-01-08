package com.haruon.groupware.approval.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;

@Service
@Transactional
public class ApprovalService {

	private final ApprovalMapper approvalMapper;
	private final CommonMapper commonMapper;
	
	public ApprovalService(ApprovalMapper approvalMapper, CommonMapper commonMapper) {
		this.approvalMapper = approvalMapper;
		this.commonMapper = commonMapper;
	}
	
	
	// 결재 코드
	public List<CommonCode> findByParentCode(String parentCode) {
		return commonMapper.findByParentCode(parentCode);
	}
	
	// 결재라인 해당 부서 직원
	public List<ResponseEmployee> findEmpByDept(int deptNo){
		return approvalMapper.findEmpByDept(deptNo);
	}
	
	// 결재 가맹점 선택 리스트
	public List<ResponseFranchise> findByFranchise() {
		return approvalMapper.findByFranchise();
	}
}
