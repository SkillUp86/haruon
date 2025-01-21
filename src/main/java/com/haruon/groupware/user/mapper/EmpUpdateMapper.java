package com.haruon.groupware.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.entity.EmpEntity;

@Mapper
public interface EmpUpdateMapper {
	// 업데이트 시 유효성 검사
	EmpEntity isAccess(int empNo);
	// 유저 정보 업데이트
	int updateEmpByEmpNo(RequestEmpUpdateInfo updateInfo);

	// 비밀번호 업데이트
	int updateEmpPw(EmpEntity empEntity);
	// 유저 정보 확인
	int findByEmpAndEmail(EmpEntity empEntity);

	
	// 직원 정보 업데이트
	Integer updateEmpBySystem(RequestEmpUpdateInfo updateInfo);
	
	// 직원 퇴사
	Integer updateExitDate(RequestEmpUpdateInfo updateInfo);

	// 모든 직원의 연가 수 업데이트 (매년 또는 사원 등록시)
	Integer updateLeaveByAnnualorJoin(EmpEntity emp);
	// Division 권한자가 수기로 연가 수 수정하는 경우
	Integer updateTotalLeaveByDivision(EmpEntity emp);
	
	// 직원의 접속상태 변경
	Integer updateEmpConnection(EmpEntity emp);
}
