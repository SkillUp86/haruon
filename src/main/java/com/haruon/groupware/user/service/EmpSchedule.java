package com.haruon.groupware.user.service;


import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmpSchedule {
	@Autowired private EmpMapper empMapper;
	@Autowired private EmpUpdateMapper empUpdateMapper;
	
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
				result += empUpdateMapper.updateLeaveByAnnualorJoin(emp); // 총 연차, 사용한 연차 업데이트
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
