package com.haruon.groupware.auth;

import com.haruon.groupware.user.entity.EmpFile;
import com.haruon.groupware.user.mapper.EmprofileMapper;
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
	private final EmprofileMapper emprofileMapper;
	
	public CustomUserDetailsService(EmpMapper empMapper, EmprofileMapper emprofileMapper) {
		this.empMapper = empMapper;
        this.emprofileMapper = emprofileMapper;
    }

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		EmpEntity empEntity = empMapper.findByEmp(email);

		EmpFile profile = emprofileMapper.findEmpFileByUser(email);
		log.debug(new CustomUserDetails(empEntity,profile).getAuthorities().toString());
		return new CustomUserDetails(empEntity,profile);
	}
}
