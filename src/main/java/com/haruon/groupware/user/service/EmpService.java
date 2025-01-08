package com.haruon.groupware.user.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
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

	 public void findAndSendNewPw(Integer empNo, String email) {
	        EmpDto empDto = new EmpDto();
	        empDto.setEmpNo(empNo);
	        empDto.setEmail(email);

	        EmpDto emp = empMapper.findEmpByEmail(empDto);
	        if (emp == null) {
	            throw new IllegalArgumentException("사원번호와 이메일이 일치하지 않습니다.");
	        }

	        String newPw = UUID.randomUUID().toString().replace("-", "");
	        String encodedPw = SHA256Util.encoding(newPw);
	        emp.setEmpPw(encodedPw);
	        empMapper.updateEmpPw(emp);

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(emp.getEmail());
	        message.setSubject("비밀번호 초기화 안내");
	        message.setText("안녕하세요.\n\n" +
	            "비밀번호 초기화 요청에 따라 임시 비밀번호가 발급되었습니다.\n" +
	            "로그인 후 반드시 비밀번호를 변경해주세요.\n\n" +
	            "임시 비밀번호: " + newPw + "\n\n" +
	            "감사합니다.");
	        javaMailSender.send(message);
	    }
	}