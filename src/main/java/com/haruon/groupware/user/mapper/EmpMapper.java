package com.haruon.groupware.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;
@Mapper
public interface EmpMapper {
	
	Emp empLogin(Emp emp);
	
	int insertEmp(EmpDto emp);
	

}
