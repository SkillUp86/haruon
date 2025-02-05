package com.haruon.groupware.user.controller;

import java.util.List;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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


	@GetMapping({ "/", "/login"})
	public String empLogin(Authentication authentication) {
//		if (authentication != null && authentication.isAuthenticated()) {
//			return "redirect:/home"; //로그인한 사용자는 홈으로 이동
//		}
		return "user/login";
	}

	@GetMapping("/addEmp")
	public String addEmp(Model model) {
		List<Dept> deptList = deptService.findByAll();
		log.debug(deptList.toString());
		model.addAttribute("deptList", deptList);
		return "user/addEmp";
	}

	// 회원가입 처리
	@PostMapping("/addEmp")
	public String addEmp(@Valid EmpDto emp, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		log.debug(emp.toString());
		if(bindingResult.hasErrors()) {
			bindingResult.getFieldErrors().forEach(error -> 
            log.debug("오류 발생 필드: {} / 메시지: {}", error.getField(), error.getDefaultMessage())
        );
			redirectAttributes.addFlashAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "redirect:/addEmp";
		}
		// 2. 회원가입 처리
		empService.addEmp(emp);
		redirectAttributes.addFlashAttribute("msg", "사원 등록 성공!");
		return "redirect:/addEmp";
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