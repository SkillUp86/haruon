package com.haruon.groupware.user.mapper;

import java.util.List;
import java.util.Map;

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

	// 방금 addEmp한 직원 정보 가져오기
	EmpEntity findNewEmp();

	// 직원 목록
	List<EmpDto> selectEmpList();
	
	// 부서별 직원 정보
	List<Map<String, Object>> selectEmpBydept(Integer depNo);
	
	// 직원 정보 수정
	Integer updateEmpInfo(Integer empNo);
	
	// 웹소켓 세션의 URI 파싱된 id 유무 확인 ( 1 = true / 0 = false )
	Integer checkEmpNo(String id);

}