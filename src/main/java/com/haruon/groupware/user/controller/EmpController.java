package com.haruon.groupware.user.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.dto.ResponseEmpInfo;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;
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
	@Autowired
	JavaMailSender javaMailSender;

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
	public String addEmp(EmpDto emp) {
		String randomPassword = UUID.randomUUID().toString().substring(0, 6);
		emp.setEmpPw(randomPassword);
		log.debug(emp.toString());
		// 2. 회원가입 처리
		empService.addEmp(emp);

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(emp.getEmail()); // 회원가입한 사용자의 이메일
		message.setSubject("회원가입 완료 및 임시 비밀번호 안내");
		message.setText("안녕하세요, " + emp.getEname() + "님.\n\n" + "회원가입이 완료되었습니다.\n"
				+ "임시 비밀번호는 아래와 같습니다. 로그인 후 반드시 비밀번호를 변경해주세요.\n\n" + "임시 비밀번호: " + randomPassword + "\n\n" + "감사합니다.");
		javaMailSender.send(message);

		// 4. 홈 화면으로 리다이렉트
		return "redirect:/login";
	}

	@GetMapping("/findPw")
	public String findPw() {
		return "user/findPw";
	}

	// 비밀번호 찾기 처리
	@PostMapping("/findPw")
	public String findPw(@RequestParam Integer empNo, @RequestParam String email, Model model) {
		try {
			// empService.findAndSendNewPw(empNo, email);
			model.addAttribute("message", "새로운 비밀번호가 이메일로 발송되었습니다.");
			return "user/login";
		} catch (IllegalArgumentException e) {
			model.addAttribute("message", e.getMessage());
		} catch (Exception e) {
			model.addAttribute("message", "오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "user/findPw";
	}
	// 내 정보
	@GetMapping("/myInfo")
	public String MyInfo(Authentication authentication, Model model) {
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		ResponseEmpInfo empInfo = empService.findByEmpInfo(empNo);
		model.addAttribute("e",empInfo);
		return "user/myInfo";
	}
	
	// 직원 목록
	@GetMapping("/employees")
	public String employees(Model model) {
		List<EmpDto> employeeList = empService.getEmpList();
		model.addAttribute("employeeList",employeeList);
		
		log.debug("employeeList{}", employeeList.toString());
	
		return "dept/employees";
	}
}