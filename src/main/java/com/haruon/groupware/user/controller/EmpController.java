package com.haruon.groupware.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.service.EmpService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {
    @Autowired EmpService empService;
    
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	log.debug("로그아웃 성공");
    	return "redirect:/login";	
    }
    
    @GetMapping("/login")
    public String empLogin() {
        return "user/login";
    }
    
    @PostMapping("/login")
    public String login(
            Model model
            ,HttpSession session
            ,@RequestParam String email
            ,@RequestParam String empPw) {
                
        Emp emp = new Emp();
        emp.setEmail(email);
        emp.setEmpPw(empPw);

        Emp empLogin = empService.empLogin(emp);
        
        // 로그인 실패 시
        if (empLogin == null) {
            log.debug("로그인 실패: 잘못된 ID 또는 비밀번호");
            return "user/login";
        }

        // 로그인 성공 시 세션 저장 후 홈 이동
        session.setAttribute("loginCustomer", empLogin.getEmail());
        log.debug("로그인 성공 ---> " + empLogin.getEmail());
        
        return "redirect:/home";
    }
    @GetMapping("/addEmp")
    public String addEmp() {
    	return "user/addEmp";
    }
    
    @PostMapping("/addEmp")
    public String addEmp(EmpDto emp) {
    	// 서비스 호출
    	empService.addEmp(emp);  	
    	return "redirect:/home";
    }
}