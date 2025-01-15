package com.haruon.groupware.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.entity.SignFile;

@Mapper
public interface EmpSignMapper {
	//전자서명 삭제
	int removeSignByEmpNo(int empNo);
	//전자서명 정보
	SignFile findSignByEmpNo(int empNo);
	//전자서명 추가
	int saveSignFile(SignFile file);
}
