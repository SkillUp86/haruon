package com.haruon.groupware.draft.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.service.DraftService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/draft")
public class DraftController {

	private final DraftService draftService;

	public DraftController(DraftService draftService) {
		this.draftService = draftService;
	}

	@GetMapping("/{type}/detail/{draNo}")
	public String draftDetail(@PathVariable String type, @PathVariable int draNo, Model model) {
		// 유효성 검사
		if (!draftService.isAccess(draNo)) {
			log.debug("접근 실패: draNo={}", draNo);
			return "redirect:/login";
		}
		Object draftDetail = null;
		String url = null;
		switch (type) {
		case "C01": // 휴가 상세보기
			draftDetail = draftService.getBasicDraftDetail(draNo);
			url = "draft/basicDetail";
			break;
		case "C02": // 출장 상세보기
			draftDetail = draftService.getBusinessDraftDetail(draNo);
			url = "draft/businessDetail";
			break;
		case "C03": // 매출 상세보기
			draftDetail = draftService.getSalesDraftDetail(draNo);
			url = "draft/salesDetail";
			break;
		case "C04": // 휴가 상세보기
			draftDetail = draftService.getVacationDraftDetail(draNo);
			url = "draft/vacationDetail";
			break;
		default:
			throw new IllegalArgumentException("없는 유형의 타입입니다. ");
		}
		log.debug("draftDetail ={}", draftDetail.toString());
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);

		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);

		return url;
	}

	// 문서리스트
	@GetMapping("/list")
	public String draftList() {

		return "draft/draftList";
	}
	// 참조 문서리스트
	@GetMapping("/refers/list")
	public String referList() {
		
		return "draft/referenceList";
	}

//	// 휴가 상세보기
//	@GetMapping("/draft/detail/vacation/{draNo}")
//	public String vacationDraft(@PathVariable int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			log.debug("실패");
//			return "redirect:/login";
//		}
//		ResponseVacationDraftDetail draftDetail = draftService.getVacationDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/vacationDetail";
//	}
//
//	// 매출 상세보기
//	@GetMapping("/draft/detail/sales/{draNo}")
//	public String salesDraft(@PathVariable int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "redirect:/login";
//		}
//		ResponseSalesDraftDetail draftDetail = draftService.getSalesDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		log.debug(draftFiles.toString());
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/salesDetail";
//	}
//
//	// 출장 상세보기
//	@GetMapping("/draft/detail/business/{draNo}")
//	public String businessDraft(@PathVariable int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "redirect:/login";
//		}
//		ResponseBusinessDraftDetail draftDetail = draftService.getBusinessDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/businessDetail";
//	}
//
//	// 기본 상세보기
//	@GetMapping("/draft/detail/basic/{draNo}")
//	public String basicDraft(@PathVariable int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "redirect:/login";
//		}
//		ResponseBasicDraftDetail draftDetail = draftService.getBasicDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		log.debug(draftFiles.toString());
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/basicDetail";
//	}

}
