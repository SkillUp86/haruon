package com.haruon.groupware.user.controller;

import java.util.List;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.service.EmpService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {
	@Autowired
	DeptService deptService;
	@Autowired
	EmpService empService;


	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("로그아웃 성공");
		return "redirect:/login";
	}

	@GetMapping({ "/", "/login"})
	public String empLogin() {
		return "user/login";
	}

	@GetMapping("/addEmp")
	public String addEmp(Model model) {
		List<Dept> deptList = deptService.findByAll();
		model.addAttribute("deptList", deptList);
		return "user/addEmp";
	}

	// 회원가입 처리
	@PostMapping("/addEmp")
	public String addEmp(@Valid EmpDto emp, BindingResult bindingResult, Model model) {
		log.debug(emp.toString());
		if(bindingResult.hasErrors()) {
			model.addAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "user/addEmp";
		}
		// 2. 회원가입 처리
		empService.addEmp(emp);

		// 4. 홈 화면으로 리다이렉트
		return "redirect:/login";
	}



	// 내 정보
	@GetMapping("/myInfo")
	public String MyInfo(Model model) {
		
		ResponseEmpInfo empInfo = empService.findByEmpInfo();
		log.debug(empInfo.toString());
		model.addAttribute("e",empInfo);
		return "user/myInfo";
	}
	
	// 직원 목록
	@GetMapping("/employees")
	public String employees(Authentication authentication, Model model) {
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int depNo = details.getDepNo();
		model.addAttribute("depNo",depNo);
		
		List<EmpDto> employeeList = empService.getEmpList();
		model.addAttribute("employeeList",employeeList);
		
		log.debug("employeeList{}", employeeList.toString());
	
		return "dept/employees";
	}
}