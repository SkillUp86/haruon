package com.haruon.groupware.config;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.SessionManagementConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http
        	.csrf(csrf -> csrf.disable());
        
        http.authorizeHttpRequests(auth -> auth
        							.requestMatchers("/home").authenticated()
					                .requestMatchers("/login").permitAll()
					                .anyRequest().permitAll()
					                );
        http.formLogin(auth -> auth
			            .loginPage("/login")
			            .usernameParameter("email")
			            .passwordParameter("empPw")
			            .loginProcessingUrl("/loginSuccess")
			            .successHandler(customLoginSuccessHandler())
			            .permitAll()
			            );
        
        http
        .sessionManagement((session) -> session
                		.sessionFixation(SessionManagementConfigurer.SessionFixationConfigurer::newSession)
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
	public WebSecurityCustomizer webSecurityCustomizer() {
	    return (web) -> web.ignoring()
	            .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
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
