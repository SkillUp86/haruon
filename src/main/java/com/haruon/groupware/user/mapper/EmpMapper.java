package com.haruon.groupware.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.entity.EmpEntity;

@Mapper
public interface EmpMapper {
	// 마이페이지
	ResponseEmpInfo findByEmpInfo(int empNo);
	
	// 시큐리티 로그인
	EmpEntity findByEmp(String email);
	
	int insertEmp(EmpDto emp);
	
	String mailCheck(String mailCheck);

	// 퇴사하지 않은 모든 사원의 사원번호를 가져오기 
	List<EmpEntity> findAllEmp();
	// 모든 직원의 연가 수 업데이트 (매년 또는 사원 등록시)
	Integer updateLeaveByAnnualorJoin(EmpEntity emp);
	// Division 권한자가 수기로 연가 수 수정하는 경우
	Integer updateTotalLeaveByDivision(EmpEntity emp);
	// 방금 addEmp한 직원 정보 가져오기
	EmpEntity findNewEmp();

}