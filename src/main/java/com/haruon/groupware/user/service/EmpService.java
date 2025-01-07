package com.haruon.groupware.user.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.app.util.SHA256Util;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.mapper.EmpMapper;

@Service
public class EmpService {
	@Autowired EmpMapper empMapper;
	
	public Emp empLogin(Emp emp) {
    	return empMapper.empLogin(emp);
    }
	
	public void addEmp(EmpDto emp) {
	    // UUID 생성 및 설정
	    String empPW = UUID.randomUUID().toString().replace("-", "");
	    System.out.println("uuid 비밀번호: " + empPW);
	    emp.setEmpPw(SHA256Util.encoding(empPW));

	    // 데이터베이스에 삽입
	    empMapper.insertEmp(emp);
	}
	
	
}
