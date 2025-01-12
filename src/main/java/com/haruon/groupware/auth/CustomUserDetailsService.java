package com.haruon.groupware.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

	private final EmpMapper empMapper;
	private final BCryptPasswordEncoder passwordEncoder;
	
	public CustomUserDetailsService(EmpMapper empMapper, BCryptPasswordEncoder passwordEncoder) {
		this.empMapper = empMapper;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		EmpEntity empEntity = empMapper.empLogin(email);
		CustomUserDetails details = new CustomUserDetails(empEntity);
		log.debug("details:--------------"+details.toString());
		return details;
	}
}
