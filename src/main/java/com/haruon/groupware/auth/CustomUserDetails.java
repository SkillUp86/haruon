package com.haruon.groupware.auth;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.haruon.groupware.user.entity.EmpEntity;

import lombok.Data;
import lombok.Getter;

@Data
public class CustomUserDetails implements UserDetails {

	private final EmpEntity empEntity;

	public CustomUserDetails(EmpEntity empEntity) {
		this.empEntity = empEntity;
	}

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
		List<Role> authorities = empEntity.getAuthorities();
		
		return authorities.stream()
				.map(e -> new SimpleGrantedAuthority(e.name())).collect(Collectors.toList());
    }

	@Override
	public String getPassword() {
		return empEntity.getEmpPw(); // 사원 비밀번호
	}

	@Override
	public String getUsername() {
		return empEntity.getEmail(); // 사용자 이름 또는 이메일
	}

	@Override
	public boolean isAccountNonExpired() {
		return true; // 계정 만료 여부
	}

	@Override
	public boolean isAccountNonLocked() {
		return true; // 계정 잠금 여부
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true; // 인증 정보 만료 여부
	}

	@Override
	public boolean isEnabled() {
		return true; // 계정 활성화 여부
	}
	
	public Integer getEmpNo() {
        return empEntity.getEmpNo(); // 사원 번호
    }

    public String getEname() {
        return empEntity.getEname(); // 사원 이름
    }

    public String getLocation() {
        return empEntity.getLocation(); // 직급
    }

    public Integer getDepNo() {
        return empEntity.getDepNo(); // 부서 번호
    }

    public String getDname() {
        return empEntity.getDname(); // 부서 이름
    }
    
    public String getConnectionStatus() {
    	return empEntity.getConnectionStatus(); // 접속 상태
    }
    
}
