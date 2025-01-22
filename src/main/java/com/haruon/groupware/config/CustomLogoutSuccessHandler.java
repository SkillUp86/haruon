package com.haruon.groupware.config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.service.EmpUpdateService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
	@Autowired EmpUpdateService empUpdateService;
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request
								, HttpServletResponse response
								, Authentication authentication) throws IOException, ServletException {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		updateEmpConnectionStatus(userDetails.getEmpNo());
		response.sendRedirect("/login");
	}
	
	// 로그아웃시 사원의 접속상태를 오프라인으로 변경
	private void updateEmpConnectionStatus(Integer empNo) {
		
		int result = empUpdateService.changeConnectionInfo(empNo, "J02");
		
		if(result == 1) {
			log.debug("회원 로그아웃 성공 - updateEmpConnectionStatus 성공");
		} else {
			log.debug("회원 로그아웃 성공 - updateEmpConnectionStatus 실패");
		}
		
	}

}
