package com.haruon.groupware.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.common.entity.CommonCode;

@Mapper
public interface ApprovalMapper {

	// 결재코드
	List<CommonCode> findByParentCode(String parentCode);
	
	// 부서별 직원 리스트
	List<ResponseEmployee> findEmpByDept(int deptNo);
	
	// 가맹점 결재 리스트
	List<ResponseFranchise> findByFranchise();
	
}
