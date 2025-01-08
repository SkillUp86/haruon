package com.haruon.groupware.user.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;
@Mapper
public interface EmpMapper {
	
	Emp empLogin(Emp emp);
	
	int insertEmp(EmpDto emp);
	
	String mailCheck(String mailCheck);

    EmpDto findEmpByEmail(Map<String, Object> params);
	
	int updateEmpPw(EmpDto emp);

}
