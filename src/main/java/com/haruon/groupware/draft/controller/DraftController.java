package com.haruon.groupware.draft.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.draft.dto.ResponseBasicDraftDetail;
import com.haruon.groupware.draft.dto.ResponseBusinessDraftDetail;
import com.haruon.groupware.draft.dto.ResponseSalesDraftDetail;
import com.haruon.groupware.draft.dto.ResponseVacationDraftDetail;
import com.haruon.groupware.draft.service.DraftService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DraftController {

	private final DraftService draftService;

	public DraftController(DraftService draftService) {
		this.draftService = draftService;
	}

	// 휴가 상세보기
	@GetMapping("/draft/detail/vacation/{draNo}")
	public String vacationDraft(@PathVariable int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseVacationDraftDetail draftDetail = draftService.getVacationDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/vacationDetail";
	}

	// 매출 상세보기
	@GetMapping("/draft/detail/sales/{draNo}")
	public String salesDraft(@PathVariable int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseSalesDraftDetail draftDetail = draftService.getSalesDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		log.debug(draftFiles.toString());
		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/salesDetail";
	}

	// 출장 상세보기
	@GetMapping("/draft/detail/business/{draNo}")
	public String businessDraft(@PathVariable int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseBusinessDraftDetail draftDetail = draftService.getBusinessDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/businessDetail";
	}

	// 기본 상세보기
	@GetMapping("/draft/detail/basic/{draNo}")
	public String basicDraft(@PathVariable int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseBasicDraftDetail draftDetail = draftService.getBasicDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		log.debug(draftFiles.toString());
		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/basicDetail";
	}

	// 문서리스트
	@GetMapping("/draft/list")
	public String draftList() {

		return "draft/draftList";
	}

}
