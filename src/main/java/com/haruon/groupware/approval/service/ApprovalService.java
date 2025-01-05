package com.haruon.groupware.approval.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.common.entity.CommonCode;

@Service
@Transactional
public class ApprovalService {

	private final ApprovalMapper approvalMapper;
	
	public ApprovalService(ApprovalMapper approvalMapper) {
		this.approvalMapper = approvalMapper;
	}
	
	// 결재 코드
	public List<CommonCode> findByParentCode(String parentCode) {
		return approvalMapper.findByParentCode(parentCode);
	}
}
