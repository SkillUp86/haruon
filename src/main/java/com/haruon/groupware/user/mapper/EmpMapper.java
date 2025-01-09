package com.haruon.groupware.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;

@Mapper
public interface EmpMapper {
	
	Emp empLogin(Emp emp);
	
	int insertEmp(EmpDto emp);
	
	String mailCheck(String mailCheck);

    EmpDto findEmpByEmail(EmpDto emp);
	
	int updateEmpPw(EmpDto emp);
	
	// 퇴사하지 않은 모든 사원의 사원번호를 가져오기 
	List<Emp> findAllEmp();
	// 모든 직원의 연가 수 업데이트 (매년 또는 사원 등록시)
	Integer updateLeaveByAnnualorJoin(Emp emp);
	// Division 권한자가 수기로 연가 수 수정하는 경우
	Integer updateTotalLeaveByDivision(Emp emp);
	// 방금 addEmp한 직원 정보 가져오기
	Emp findNewEmp();

}