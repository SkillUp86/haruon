package com.haruon.groupware.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

<<<<<<< HEAD
import com.haruon.groupware.user.dto.EmpDto;
=======
import com.haruon.groupware.approval.dto.EmployeeResponse;
>>>>>>> develop
import com.haruon.groupware.user.entity.Emp;
@Mapper
public interface EmpMapper {
	
	Emp empLogin(Emp emp);
<<<<<<< HEAD
	
	int insertEmp(EmpDto emp);
	

=======

	List<EmployeeResponse> findEmpByDept(int deptNo);
>>>>>>> develop
}
