package com.haruon.groupware.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http
        	.csrf(csrf -> csrf.disable());

        http.authorizeHttpRequests(auth -> auth
									.requestMatchers("/login", "/findPw", "/layouts/**", "/src/**","/WEB-INF/view/**", "/readMe").permitAll()
									.requestMatchers("/addEmp","/insertNotice", "/modifyNotice").hasRole("HR") // 인사과만 사원 추가, 공지 등록•수정 가능
									.requestMatchers("/categories","/company/modify","/depts/update").hasRole("IT") // 전산과만
									.requestMatchers("/franchises", "/franchises/**").hasRole("FM") // 가맹점과만
									.requestMatchers("/department/attendance").hasRole("HEAD") // 부서장만
					                .anyRequest().authenticated()
					                );
        http.formLogin(auth -> auth
			            .loginPage("/login")
			            .usernameParameter("email")
			            .passwordParameter("empPw")
			            .loginProcessingUrl("/loginSuccess")
			            .successHandler(customLoginSuccessHandler())
						.failureHandler(customLoginFailureHandler())
			            .permitAll()
			            );
		http.sessionManagement(session -> session
						.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
						.sessionConcurrency(concurrency -> concurrency
								.maximumSessions(1)
								.maxSessionsPreventsLogin(false)
						)
				);
        http.logout(logout -> logout
        		.logoutUrl("/logout")
        		.logoutSuccessHandler(customLogoutSuccessHandler())
        		.invalidateHttpSession(true)
        		.deleteCookies("JSESSIONID")
        		);
        
		return http.build();
	}


	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationFailureHandler customLoginFailureHandler() {
		return new CustomLoginFailureHandler();
	}

	@Bean
	public CustomLoginSuccessHandler customLoginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}
	
	@Bean
	public CustomLogoutSuccessHandler customLogoutSuccessHandler() {
		return new CustomLogoutSuccessHandler();
	}
}
