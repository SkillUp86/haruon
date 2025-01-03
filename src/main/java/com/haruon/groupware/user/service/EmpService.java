package com.haruon.groupware.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.mapper.EmpMapper;

@Service
public class EmpService {
	@Autowired EmpMapper empMapper;
	
	public Emp empLogin(Emp emp) {
    	return empMapper.empLogin(emp);
    }

}
