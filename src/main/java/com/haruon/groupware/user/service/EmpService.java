package com.haruon.groupware.user.service;

import java.util.HashMap;
import java.util.Map;
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

	public String resetPassword(String empNo, String email) {
	    // 1. 사원번호와 이메일로 사용자 조회
	    Map<String, Object> params = new HashMap<>();
	    params.put("empNo", empNo);
	    params.put("email", email);
	    EmpDto emp = empMapper.findEmpByEmail(params);

        if (emp == null) {
            // 사원번호와 이메일이 일치하지 않음
            return null;
        }
        // 2. UUID 기반 임시 비밀번호 생성
        String rawPassword = UUID.randomUUID().toString().replace("-", "");
        // 3. 비밀번호 암호화
        String newPassword = SHA256Util.encoding(rawPassword);
        // 4. DB 업데이트
        emp.setEmpPw(newPassword);
        empMapper.updateEmpPw(emp);
        // 5. 원본 비밀번호 반환 (이메일 발송용)
        return rawPassword;
    }
}
