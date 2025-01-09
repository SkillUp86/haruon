package com.haruon.groupware.draft.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.haruon.groupware.draft.dto.ResponseDraft;
import com.haruon.groupware.draft.dto.ResponseDraftDetail;
import com.haruon.groupware.draft.service.DraftService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DraftController {
	
	private final DraftService draftService;
	
	public DraftController(DraftService draftService) {
		this.draftService = draftService;
	}
	// 결재 상세보기
	@GetMapping("/draft/{draNo}")
	public String draft(@PathVariable int draNo, HttpSession session, Model model) {
		int empNo = (int)session.getAttribute("loginEmpNo");
		ResponseDraftDetail draftDetail = draftService.getDraftDetail(draNo, empNo);
		model.addAttribute("d", draftDetail);
		return "draft/draftDetail";
	}
	
	// 문서리스트
	@GetMapping("/draft/list")
	public String draftList(HttpSession session, Model model) {
		int empNo = (int)session.getAttribute("loginEmpNo");
		List<ResponseDraft> draftList = draftService.getDraftByPage(empNo);
		log.debug(draftList.toString());
		model.addAttribute("draftList", draftList);
		
		return "draft/draftList";
	}
	
	
}
