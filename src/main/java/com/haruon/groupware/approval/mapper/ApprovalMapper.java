package com.haruon.groupware.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.dto.EmployeeResponse;
import com.haruon.groupware.common.entity.CommonCode;

@Mapper
public interface ApprovalMapper {

	// 결재코드
	List<CommonCode> findByParentCode(String parentCode);
	
	
}
