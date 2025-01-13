package com.haruon.groupware.auth;

import lombok.Getter;

@Getter
public enum Role {
	// 직급
	ROLE_EMPLOYEE("사원"),
	ROLE_MANAGER("팀장"),
	ROLE_HEAD("부서장"),
	
	// 부서
	ROLE_HR("인사과"),
	ROLE_FM("가맹점관리과"),
	ROLE_SALES("영업지원과"),
	ROLE_IT("전산과");

	private String description;

	Role(String description) {
		this.description = description;
	}
	
}
