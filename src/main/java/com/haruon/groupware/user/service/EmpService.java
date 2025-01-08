package com.haruon.groupware.user.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.mapper.EmpMapper;
import com.haruon.groupware.user.util.SHA256Util;

@Service
public class EmpService {
	@Autowired EmpMapper empMapper;
    @Autowired JavaMailSender javaMailSender;

	
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

	public void findAndSendNewPw(EmpDto emp) {
	    empMapper.findEmpByEmail(empNo, email);
	    if (emp == null) {
	        // 예외를 던져 실패 상황 처리
	        throw new IllegalArgumentException("사원번호와 이메일이 일치하지 않습니다.");
	    }

	    // 새 비밀번호 생성 및 업데이트
	    String newPw = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
	    String encodedPw = SHA256Util.encoding(newPw);
	    emp.setEmpPw(encodedPw);
	    empMapper.updateEmpPw(emp);

	    // 이메일 발송
	    updateEmpPw(emp.getEmail());
	}
}