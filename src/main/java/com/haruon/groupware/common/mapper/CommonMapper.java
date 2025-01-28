package com.haruon.groupware.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.common.entity.CommonCode;

@Mapper
public interface CommonMapper {

	// 결재코드
		List<CommonCode> findByParentCode(String parentCode);

		
	
}
