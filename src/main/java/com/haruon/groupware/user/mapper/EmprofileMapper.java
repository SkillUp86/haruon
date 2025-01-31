package com.haruon.groupware.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.entity.EmpFile;

@Mapper
public interface EmprofileMapper {

	int saveProfileByUser(EmpFile empFile);
	
	EmpFile findEmpFileByUser(String email);

	int removeProfileFile(String email);

}
