package com.haruon.groupware.draft.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.dto.ResponseDraftDetail;
import com.haruon.groupware.draft.service.DraftService;

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
	public String draft(@PathVariable int draNo, Model model) {
		ResponseDraftDetail draftDetail = draftService.getDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		log.debug(draftDetail.toString());
		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/draftDetail";
	}
	
	// 문서리스트
	@GetMapping("/draft/list")
	public String draftList() {
		
		return "draft/draftList";
	}
	
	
}
