package com.haruon.groupware.approval.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.user.mapper.EmpMapper;

@Service
@Transactional
public class ApprovalService {

	private final ApprovalMapper approvalMapper;
	private final EmpMapper empMapper;
	
	
	
	public ApprovalService(ApprovalMapper approvalMapper, EmpMapper empMapper) {
		this.approvalMapper = approvalMapper;
		this.empMapper = empMapper;
	}
	
	// 결재 코드
	public List<CommonCode> findByParentCode(String parentCode) {
		return approvalMapper.findByParentCode(parentCode);
	}
	
	// 결재라인 해당 부서 직원
	public List<ResponseEmployee> findEmpByDept(int deptNo){
		return empMapper.findEmpByDept(deptNo);
	}
}
