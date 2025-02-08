package com.haruon.groupware.exception;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {
	// 결재 유형에 따른 유효성 검증 예외 처리
	@ExceptionHandler(InvalidApprovalException.class)
    public String handleInvalidApprovalException(InvalidApprovalException ex, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("msg", ex.getMessage()); 
     // 유효성 검증 실패 시 작성 폼으로 리다이렉트
        return "redirect:/approval"; 
    }
	// 남은 연차 갯수 계산 예외 처리
	@ExceptionHandler(NotEnoughLeaveException.class)
	public String handleNotEnoughLeaveException(NotEnoughLeaveException ex, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		redirectAttributes.addFlashAttribute("msg", ex.getMessage());

		// 요청 URL에서 PathVariable 추출 및 리다이렉트 처리
		String requestURI = request.getRequestURI();
		// 주소 변경 로직 approval → draft, final → detail
		String URI = requestURI.replace("final", "detail").replace("approval", "draft");

		return "redirect:" + URI;
	}

	// 이메일 중복 예외 처리
	@ExceptionHandler(DataIntegrityViolationException.class)
	public String handleDuplicateEmailException(DataIntegrityViolationException ex, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		redirectAttributes.addFlashAttribute("failMsg", "이미 가입된 이메일입니다.");

		// 사원 등록 페이지로 리다이렉트
		return "redirect:/addEmp";
	}
	
	// 회원찾기 예외 처리
	@ExceptionHandler(EmpNotFoundException.class)
	public String handleEmpNotFoundException(EmpNotFoundException ex, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("msg", ex.getMessage());
		return "redirect:/findPw";
	}
}