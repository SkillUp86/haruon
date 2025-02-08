package com.haruon.groupware.user.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpService {

	private final EmpMapper empMapper;
	private final JavaMailSender javaMailSender;
	private final BCryptPasswordEncoder passwordEncoder;

	public EmpService(EmpMapper empMapper, JavaMailSender javaMailSender, BCryptPasswordEncoder passwordEncoder) {
		this.empMapper = empMapper;
		this.javaMailSender =javaMailSender;
		this.passwordEncoder = passwordEncoder;
	}
	// 사원 마이페이지
	public ResponseEmpInfo findByEmpInfo() {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		return empMapper.findByEmpInfo(empNo);
	}
	
	public EmpEntity findByEmail(String email) {
		
		return empMapper.findByEmp(email);
	}
	public void addEmp(EmpDto emp) {
		EmpEntity existingEmp = empMapper.findByEmp(emp.getEmail());
		if(existingEmp!=null) {
			throw new DataIntegrityViolationException("이미 가입된 이메일입니다.");
		}
		String randomPassword = UUID.randomUUID().toString().substring(0, 6);
		emp.setEmpPw(passwordEncoder.encode(randomPassword));
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("Haruon86@gmail.com");
		message.setTo(emp.getEmail()); // 회원가입한 사용자의 이메일
		message.setSubject("회원가입 완료 및 임시 비밀번호 안내");
		message.setText("안녕하세요, " + emp.getEname() + "님.\n\n" + "회원가입이 완료되었습니다.\n"
				+ "임시 비밀번호는 아래와 같습니다. 로그인 후 반드시 비밀번호를 변경해주세요.\n\n" + "임시 비밀번호: " + randomPassword + "\n\n" + "감사합니다.");
		javaMailSender.send(message);
		empMapper.insertEmp(emp);
	}
	
	// 직원 목록
	public List<EmpDto> getEmpList(){
		return empMapper.selectEmpList();
	}
	
	// 부서별 직원 정보
	public List<Map<String,Object>> getEmpBydept(Integer depNo){
		return empMapper.selectEmpBydept(depNo);
	}
	
}