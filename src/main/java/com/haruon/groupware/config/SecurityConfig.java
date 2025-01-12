package com.haruon.groupware.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
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
					                .requestMatchers("/**", "/login").permitAll()
					                .anyRequest().permitAll()
					                );
        http.formLogin(auth -> auth
			            .loginPage("/login")
			            .usernameParameter("email")
			            .passwordParameter("empPw")
			            .loginProcessingUrl("/loginSuccess")
			            .defaultSuccessUrl("/home", true)
			            .permitAll()
			            );
        
		return http.build();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
