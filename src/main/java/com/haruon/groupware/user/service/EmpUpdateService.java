package com.haruon.groupware.user.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.dto.RequestEmpUpdateInfo;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

@Transactional
@Service
public class EmpUpdateService {

	private final EmpUpdateMapper empUpdateMapper;
	private final BCryptPasswordEncoder passwordEncoder;

	public EmpUpdateService(EmpUpdateMapper empUpdateMapper, BCryptPasswordEncoder passwordEncoder) {
		this.empUpdateMapper = empUpdateMapper;
		this.passwordEncoder = passwordEncoder;
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
}
