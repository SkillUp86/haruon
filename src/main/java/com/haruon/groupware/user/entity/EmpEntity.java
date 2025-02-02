package com.haruon.groupware.user.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.auth.Role;

import lombok.Data;

@Data
public class EmpEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer empNo;
	private String email;
	private String empPw;
	private Integer depNo; // 부서번호
	private String ename;
	private String location; // 직급
	private String extNum;
	private String phone;
	private String address;
	private String postCode;
	private String gender;
	private String birth;
	private Integer totalLeave;
	private Integer usedLeave;
	private String pwUpdate;
	private String joinDate;
	private String exitDate;
	private String dname;
	private String connectionStatus;

	public List<Role> getAuthorities() {
		List<Role> authorities = new ArrayList<>();

		// 부서 번호에 따른 권한 설정
		if (depNo == 1) { // 인사과
			authorities.add(Role.ROLE_HR);
		} else if (depNo == 2) { // 가맹점관리과
			authorities.add(Role.ROLE_FM);
		} else if (depNo == 3) { // 영업지원과
			authorities.add(Role.ROLE_SALES);
		} else if (depNo == 4) { // 전산과
			authorities.add(Role.ROLE_IT);
		}

		// 직급에 따른 권한 설정
		if ("사원".equalsIgnoreCase(location)) { // 사원
			authorities.add(Role.ROLE_EMPLOYEE);
		} else if ("팀장".equalsIgnoreCase(location)) { // 팀장
			authorities.add(Role.ROLE_MANAGER);
		} else if ("부서장".equalsIgnoreCase(location)) { // 부서장
			authorities.add(Role.ROLE_HEAD);
		}

		return authorities;
	}
	
	public boolean checkRole(Authentication authentication, Role role) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		return userDetails.getAuthorities().contains(Role.ROLE_HEAD);
	}
	

}
