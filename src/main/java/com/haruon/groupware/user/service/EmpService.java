package com.haruon.groupware.user.service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.haruon.groupware.user.dto.EmpDto;
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
		this.javaMailSender = javaMailSender;
		this.passwordEncoder = passwordEncoder;
	}
	
	public EmpEntity findByEmail(String email) {
		return empMapper.empLogin(email);
	}
	public void addEmp(EmpDto emp) {
		emp.setEmpPw(passwordEncoder.encode(emp.getEmpPw()));
		// 데이터베이스에 삽입
		empMapper.insertEmp(emp);

	}

//	public void findAndSendNewPw(Integer empNo, String email) {
//		EmpDto empDto = new EmpDto();
//		empDto.setEmpNo(empNo);
//		empDto.setEmail(email);
//
//		EmpDto emp = empMapper.findEmpByEmail(empDto);
//		if (emp == null) {
//			throw new IllegalArgumentException("사원번호와 이메일이 일치하지 않습니다.");
//		}
//
//		String newPw = UUID.randomUUID().toString().replace("-", "");
//		String encodedPw = SHA256Util.encoding(newPw);
//		emp.setEmpPw(encodedPw);
//		empMapper.updateEmpPw(emp);
//
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setTo(emp.getEmail());
//		message.setSubject("비밀번호 초기화 안내");
//		message.setText("안녕하세요.\n\n" + "비밀번호 초기화 요청에 따라 임시 비밀번호가 발급되었습니다.\n" + "로그인 후 반드시 비밀번호를 변경해주세요.\n\n"
//				+ "임시 비밀번호: " + newPw + "\n\n" + "감사합니다.");
//		javaMailSender.send(message);
//	}

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

	
}