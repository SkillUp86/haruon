package com.haruon.groupware.user.service;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Transactional
@Slf4j
public class EmpAspect {
	@Autowired EmpUpdateMapper empUpdateMapper;
	@Autowired EmpMapper empMapper;
	
	private final Integer DEFAULT_TOTAL_LEAVE = 15;
	private final Integer TOTAL_MONTH = 12;
	
	// 신규 사원 총 연차 수 계산 메서드
	private Integer calculateTotalLeave(Integer joinMonth) {
		return (int) Math.floor(DEFAULT_TOTAL_LEAVE * (TOTAL_MONTH - (joinMonth - 1)) / TOTAL_MONTH);
	}
	
	@After("execution(* com.haruon.groupware.user.service.EmpService.addEmp(..))")
	public void postAddEmp() {
		log.debug("postAddEmp AOP 실행");
		EmpEntity newEmp = empMapper.findNewEmp();
		log.debug("신규사원 정보 = " + newEmp.toString());
		
		Integer joinMonth = Integer.parseInt(newEmp.getJoinDate().substring(5, 7));
		Integer setTotalLeave = calculateTotalLeave(joinMonth);
		
		newEmp.setTotalLeave(setTotalLeave);
		
		try {
			Integer result = empUpdateMapper.updateLeaveByAnnualorJoin(newEmp);
			if(result != 1) {
				throw new RuntimeException();
			}
			log.debug("EmpAspect - postAddEmp(총 연차 갯수 수정) 성공");
		} catch(RuntimeException e) {
			log.debug("EmpAspect - postAddEmp(총 연차 갯수 수정) 실패");
		}
		
	}
	
	
	
}