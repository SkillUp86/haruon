package com.haruon.groupware.user.service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
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
	public ResponseEmpInfo findByEmpInfo(int empNo) {
		
		return empMapper.findByEmpInfo(empNo);
	}
	
	public EmpEntity findByEmail(String email) {
		
		return empMapper.findByEmp(email);
	}
	public void addEmp(EmpDto emp) {
		String randomPassword = UUID.randomUUID().toString().substring(0, 6);
		emp.setEmpPw(passwordEncoder.encode(randomPassword));
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(emp.getEmail()); // 회원가입한 사용자의 이메일
		message.setSubject("회원가입 완료 및 임시 비밀번호 안내");
		message.setText("안녕하세요, " + emp.getEname() + "님.\n\n" + "회원가입이 완료되었습니다.\n"
				+ "임시 비밀번호는 아래와 같습니다. 로그인 후 반드시 비밀번호를 변경해주세요.\n\n" + "임시 비밀번호: " + randomPassword + "\n\n" + "감사합니다.");
		javaMailSender.send(message);
		empMapper.insertEmp(emp);
	}

	// 매년 00시 00분 00초 기준으로 모든 직원의 총 연가 수와 사용한 연가 수가 리셋된다.
	@Scheduled(cron = "00 00 00 1 1 *")
	public void scheduleAnnualLeaveUpdate() {
		List<EmpEntity> empList = empMapper.findAllEmp(); // 모든 직원의 연차 정보 가져오기

		Integer nowYear = LocalDate.now().getYear(); // 현재 년도
		Integer result = 0; // 업데이트 결과

		for (EmpEntity emp : empList) {
			Integer workPeriod = nowYear - Integer.parseInt(emp.getJoinDate().substring(0, 4)); // 사원의 연차(1월1일 기준 무조건
																								// +1)
			Integer totalLeave = (workPeriod > 2) ? 15 + (workPeriod - 1) / 2 : 15; // 계산된 연차(3년차 +1, 2년마다 1개씩 증가)

			emp.setTotalLeave(totalLeave);
			emp.setUsedLeave(0);
			result += empMapper.updateLeaveByAnnualorJoin(emp); // 총 연차, 사용한 연차 업데이트
		}

		log.debug("scheduleAnnualLeaveUpdate 스케쥴 실행");

		try {
			if (result != empList.size()) {
				throw new RuntimeException();
			}
			log.debug("scheduleAnnualLeaveUpdate 스케쥴 성공");
		} catch (RuntimeException e) {
			log.debug("scheduleAnnualLeaveUpdate 스케쥴링 오류");
		}
	}
	
	// 직원 목록
	public List<EmpDto> getEmpList(){
		return empMapper.selectEmpList();
	}
	
}