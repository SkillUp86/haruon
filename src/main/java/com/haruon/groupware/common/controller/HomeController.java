package com.haruon.groupware.common.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.approval.dto.ResponseApprovalCount;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.board.service.BoardService;

@Controller
public class HomeController {
	@Autowired BoardService boardService;
	
	private final ApprovalService approvalService;

	public HomeController(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@GetMapping("/home")
	public String home(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
		model.addAttribute("empNo", empNo);
		model.addAttribute("deptNo", userDetails.getDepNo());
		
		// 결재 상태 표기
		ResponseApprovalCount draft = approvalService.getApprovalByMainPage(empNo);
		model.addAttribute("d", draft);
		
		// 자유 게시판 5개
		List<Map<String,Object>> boardList = boardService.getBoardHome();
		model.addAttribute("boardList",boardList);
		// 공지 5개
		List<Map<String,Object>> noticeList = boardService.getNoticeHome();
		model.addAttribute("noticeList",noticeList);
		
		return "home";
	}
	
	@GetMapping("/readMe")
	public String readMe() {
		return "readMe";
	}
}
