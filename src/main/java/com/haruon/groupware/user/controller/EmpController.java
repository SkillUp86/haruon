package com.haruon.groupware.user.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.entity.Emp;
import com.haruon.groupware.user.service.EmpService;
import com.haruon.groupware.user.util.SHA256Util;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {
	@Autowired DeptService deptService;
    @Autowired EmpService empService;
    @Autowired JavaMailSender javaMailSender;

    
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
        log.debug(empLogin.toString());
        // 로그인 성공 시 세션에 다양한 정보 저장
        session.setAttribute("loginEmpEmail", empLogin.getEmail());
        session.setAttribute("loginEmpName", empLogin.getEname()); // 이름 저장
        session.setAttribute("loginEmpNo", empLogin.getEmpNo()); // 사원번호 저장
        session.setAttribute("loginEmpDept", empLogin.getDepNo()); // 부서번호 저장
        session.setAttribute("loginEmpLocation", empLogin.getLocation()); // 부서번호 저장
        session.setAttribute("loginDname", empLogin.getDname()); // 부서이름

        log.debug("로그인 성공 ---> " + empLogin.getEmail());

        return "redirect:/home";
    }
    
    @GetMapping("/addEmp")
    public String addEmp(Model model) {
    	List<Dept> deptList = deptService.findByAll();
    	model.addAttribute("deptList" , deptList);
    	return "user/addEmp";
    }

    // 회원가입 처리
    @PostMapping("/addEmp")
    public String addEmp(EmpDto emp) {
        // 1. 비밀번호 생성 및 설정
        String rawPassword = UUID.randomUUID().toString().replace("-", ""); // UUID 비밀번호 생성
        String encryptedPassword = SHA256Util.encoding(rawPassword);// 비밀번호 암호화
        emp.setEmpPw(encryptedPassword);

        // 2. 회원가입 처리
        empService.addEmp(emp);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(emp.getEmail()); // 회원가입한 사용자의 이메일
        message.setSubject("회원가입 완료 및 임시 비밀번호 안내");
        message.setText(
            "안녕하세요, " + emp.getEname() + "님.\n\n" +
            "회원가입이 완료되었습니다.\n" +
            "임시 비밀번호는 아래와 같습니다. 로그인 후 반드시 비밀번호를 변경해주세요.\n\n" +
            "임시 비밀번호: " + rawPassword + "\n\n" +
            "감사합니다."
        );
        javaMailSender.send(message);

        // 4. 홈 화면으로 리다이렉트
        return "redirect:/home";
    }

   
    @GetMapping("/findPw")
    public String findPw() {
        return "user/findPw";
    }
 // 비밀번호 찾기 처리
    @PostMapping("/findPw")
    public String findPw(EmpDto emp, Model model) {
        try {
            // Service 호출 (성공 여부 확인 대신 예외 처리 사용)
            empService.findAndSendNewPw(empNo, email);
            model.addAttribute("message", "새로운 비밀번호가 이메일로 발송되었습니다.");
        } catch (IllegalArgumentException e) {
            model.addAttribute("message", e.getMessage());
        } catch (Exception e) {
            model.addAttribute("message", "오류가 발생했습니다. 다시 시도해주세요.");
        }

        return "user/findPw";
    }
    // 이메일 발송 메서드
    private void sendResetPassword() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(EmpDto.getEmail());
        message.setSubject("비밀번호 초기화 안내");
        message.setText(
            "안녕하세요.\n\n" +
            "비밀번호 초기화 요청에 따라 임시 비밀번호가 발급되었습니다.\n" +
            "로그인 후 반드시 비밀번호를 변경해주세요.\n\n" +
            "임시 비밀번호: " + newPassword + "\n\n" +
            "감사합니다."
        );
        javaMailSender.send(message);
    }
}

