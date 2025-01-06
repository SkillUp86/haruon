package com.haruon.groupware.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.common.entity.CommonCode;

@Mapper
public interface ApprovalMapper {

	// 결재코드
	public List<CommonCode> findByParentCode(String parentCode);
}
