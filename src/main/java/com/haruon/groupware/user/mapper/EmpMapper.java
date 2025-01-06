package com.haruon.groupware.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.dto.EmployeeResponse;
import com.haruon.groupware.user.entity.Emp;
@Mapper
public interface EmpMapper {
	
	Emp empLogin(Emp emp);

	List<EmployeeResponse> findEmpByDept(int deptNo);
}
