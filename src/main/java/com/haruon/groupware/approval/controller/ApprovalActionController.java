package com.haruon.groupware.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.approval.service.ApprovalActionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval")
public class ApprovalActionController {

	private final ApprovalActionService approvalActionService;

	public ApprovalActionController(ApprovalActionService approvalActionService) {
		this.approvalActionService = approvalActionService;
	}

	// 반려사유
	@PostMapping("{type}/reject/{draNo}")
	public String description(@PathVariable String type, @PathVariable int draNo, @RequestParam String reasonDenial, RedirectAttributes redirectAttributes) {
		if (!approvalActionService.isAccessByRejectApproval(draNo)) {
			redirectAttributes.addFlashAttribute("msg", "권한이 없습니다");
			redirectAttributes.addFlashAttribute("url", "/home");
			return "redirect:/draft/" + type + "/detail/" + draNo;
		}
		log.debug("description = {} , draNo = {} ", reasonDenial, draNo);
		int rejectDescription = approvalActionService.getRejectDescription(draNo, reasonDenial);
		if (rejectDescription == 1) {
			redirectAttributes.addFlashAttribute("rejectMsg", "사유 입력 성공");
			return "redirect:/draft/" + type + "/detail/" + draNo;
		}
		return "login";
	}

	// 최종결재자 승인
	@GetMapping("{type}/final/{draNo}")
	public String finalApproval(@PathVariable String type, @PathVariable int draNo, RedirectAttributes redirectAttributes) {
		// 유효성 검사
		int findSignByEmpNo = approvalActionService.getFindSignByEmpNo();
		log.debug("findSignByEmpNo = {}", findSignByEmpNo);
		if (findSignByEmpNo != 1) {
			redirectAttributes.addFlashAttribute("msg", "전자 서명을 먼저 등록해주세요");
			redirectAttributes.addFlashAttribute("url", "/myInfo");
			return "redirect:/draft/" + type + "/detail/" + draNo;
		} else if (!approvalActionService.isAccessByFinalApproval(draNo)) {
			return "login";
		}
		approvalActionService.getUpdateFinalApproval(draNo, type);
		return "redirect:/draft/" + type + "/detail/" + draNo;
	}

	// 중간결재자 승인
	@GetMapping("{type}/mid/{draNo}")
	public String midApproval(@PathVariable String type, @PathVariable int draNo, RedirectAttributes redirectAttributes) {
		// 유효성 검사
		int findSignByEmpNo = approvalActionService.getFindSignByEmpNo();
		log.debug("findSignByEmpNo = {}", findSignByEmpNo);
		if (findSignByEmpNo != 1) {
			redirectAttributes.addFlashAttribute("msg", "전자 서명을 먼저 등록해주세요");
			redirectAttributes.addFlashAttribute("url", "/myInfo");
			return "redirect:/draft/" + type + "/detail/" + draNo;
		} else if (!approvalActionService.isAccessBymidApproval(draNo)) {
			return "login";
		}

		approvalActionService.getUpdateMidApproval(draNo);
		return "redirect:/draft/" + type + "/detail/" + draNo;
	}

}
