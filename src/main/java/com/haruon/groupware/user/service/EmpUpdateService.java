package com.haruon.groupware.user.service;

import java.util.UUID;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

@Transactional
@Service
public class EmpUpdateService {

	private final EmpUpdateMapper empUpdateMapper;
	private final EmpMapper empMapper;
	private final JavaMailSender javaMailSender;
	private final BCryptPasswordEncoder passwordEncoder;

	public EmpUpdateService(EmpUpdateMapper empUpdateMapper, JavaMailSender javaMailSender, EmpMapper empMapper, BCryptPasswordEncoder passwordEncoder) {
		this.empUpdateMapper = empUpdateMapper;
		this.javaMailSender = javaMailSender;
		this.empMapper = empMapper;
		this.passwordEncoder = passwordEncoder;
	}
	public void findAndSendNewPw(EmpEntity empEntity) {

		int emp = empUpdateMapper.findByEmpAndEmail(empEntity);
		if (emp != 1) {
			throw new IllegalArgumentException("사원번호와 이메일이 일치하지 않습니다.");
		}
		String randomPassword = UUID.randomUUID().toString().substring(0, 6);
		empEntity.setEmpPw(passwordEncoder.encode(randomPassword));
		empUpdateMapper.updateEmpPw(empEntity);

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(empEntity.getEmail());
		message.setSubject("비밀번호 초기화 안내");
		message.setText("안녕하세요.\n\n" + "비밀번호 초기화 요청에 따라 임시 비밀번호가 발급되었습니다.\n" + "로그인 후 반드시 비밀번호를 변경해주세요.\n\n"
				+ "임시 비밀번호: " + randomPassword + "\n\n" + "감사합니다.");
		javaMailSender.send(message);
	}
	
	// 관리자 개인정보 수정
	public ResponseEmpInfo findByEmpInfo(int empNo) {
		return empMapper.findByEmpInfo(empNo);
	}
	
	// 유효성 검증
	public boolean isAccess(int empNo) {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int loginEmpNo = details.getEmpNo();
		int InfoEmpNo = empUpdateMapper.isAccess(empNo).getEmpNo();

		if (loginEmpNo == InfoEmpNo) {
			return true;
		}
		return false;
	}
	// 유저 업데이트
	public int updateEmpInfo(RequestEmpUpdateInfo updateInfo) {
		updateInfo.setPassword(passwordEncoder.encode(updateInfo.getPassword()));
		return empUpdateMapper.updateEmpByEmpNo(updateInfo);
	}
	
	// 직원 정보 업데이트
	public Integer updateEmpBySystem(RequestEmpUpdateInfo updateInfo) {
		return empUpdateMapper.updateEmpBySystem(updateInfo);
	}
	
	// 직원 퇴사
	public Integer updateLeaveDate(RequestEmpUpdateInfo updateInfo) {
		return empUpdateMapper.updateLeaveDate(updateInfo);
	}
	
	// 메신저 접속/상태변경 시 사원의 접속정보 변경
	public Integer changeConnectionInfo(Integer empNo, String connStatus) {
		EmpEntity emp = new EmpEntity();
		
		String setConnStatus = switch(connStatus) {
			case "온라인" -> "J01";
			case "오프라인" -> "J02";
			case "자리비움" -> "J03";
			case "방해금지" -> "J04";
			default -> "J02";	// 잘못된 값 입력시 상태를 로그아웃 처리
		};
		
		emp.setEmpNo(empNo);
		emp.setConnectionStatus(setConnStatus);
		return empUpdateMapper.updateEmpConnection(emp);
	}
}
