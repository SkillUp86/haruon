package com.haruon.groupware.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.app.util.SHA256Util;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.service.EmpService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {
	@Autowired DeptService deptService;
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
            Model model,
            HttpSession session,
            @RequestParam String email,
            @RequestParam String empPw) {

        Emp emp = new Emp();
        emp.setEmail(email);
        emp.setEmpPw(empPw);

        Emp empLogin = empService.empLogin(emp);

        // 로그인 실패 시
        if (empLogin == null) {
            log.debug("로그인 실패: 잘못된 ID 또는 비밀번호");
            return "user/login";
        }

        // 로그인 성공 시 세션에 다양한 정보 저장
        session.setAttribute("loginEmpEmail", empLogin.getEmail());
        session.setAttribute("loginEmpName", empLogin.getEname()); // 이름 저장
        session.setAttribute("loginEmpNo", empLogin.getEmpNo()); // 사원번호 저장
        session.setAttribute("loginEmpDept", empLogin.getDepNo()); // 부서번호 저장
        session.setAttribute("loginEmpDept", empLogin.getLocation()); // 부서번호 저장

        log.debug("로그인 성공 ---> " + empLogin.getEmail());

        return "redirect:/home";
    }
    
    @GetMapping("/addEmp")
    
    public String addEmp(Model model) {
    	List<Dept> deptList = deptService.findByAll();
    	model.addAttribute("deptList" , deptList);
    	return "user/addEmp";
    }

    @PostMapping("/addEmp")
    public String addEmp(EmpDto emp) {
    	// 서비스 호출
    	String empPw = SHA256Util.encoding(emp.getEmpPw());
    	emp.setEmpPw(empPw);
    	empService.addEmp(emp);
    	return "redirect:/home";
    }
   
}