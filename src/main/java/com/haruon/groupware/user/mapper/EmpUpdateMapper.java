package com.haruon.groupware.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.entity.EmpEntity;

@Mapper
public interface EmpUpdateMapper {
	// 업데이트 시 유효성 검사
	EmpEntity isAccess(int empNo);
	// 유저 정보 업데이트
	int updateEmpByEmpNo(RequestEmpUpdateInfo updateInfo);
	// 비밀번호 업데이트
	int updateEmpPw(EmpEntity empEntity);
	// 유저 정보 확인
	int findByEmpAndEmail(EmpEntity empEntity);
}
