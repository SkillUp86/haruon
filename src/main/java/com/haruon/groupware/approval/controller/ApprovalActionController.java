package com.haruon.groupware.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.approval.entity.ApprovalEntity;
import com.haruon.groupware.approval.service.ApprovalActionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/draft")
public class ApprovalActionController {

	private final ApprovalActionService approvalActionService;

	public ApprovalActionController(ApprovalActionService approvalActionService) {
		this.approvalActionService = approvalActionService;
	}

	// 반려사유
	@PostMapping("/description")
	public String description(ApprovalEntity approvalEntity, RedirectAttributes redirectAttributes) {
		if (!approvalActionService.isAccessByRejectApproval(approvalEntity.getDraNo())) {
			redirectAttributes.addFlashAttribute("msg", "권한이 없습니다");
			redirectAttributes.addFlashAttribute("url", "/home");
			return "redirect:/draft/detail/basic/" + approvalEntity.getDraNo();
		}
		log.debug("description = {} , draNo = {} ", approvalEntity.getReasonDenial(), approvalEntity.getDraNo());
		int rejectDescription = approvalActionService.getRejectDescription(approvalEntity);
		redirectAttributes.addFlashAttribute("rejectMsg", "사유 입력 성공");
		return "redirect:/draft/detail/basic/" + approvalEntity.getDraNo();
	}

	// 최종결재자 승인
	@GetMapping("/final-approval/{draNo}")
	public String finalApproval(@PathVariable int draNo, RedirectAttributes redirectAttributes) {
		int findSignByEmpNo = approvalActionService.getFindSignByEmpNo();
		log.debug("findSignByEmpNo = {}", findSignByEmpNo);
		if (findSignByEmpNo != 1) {
			redirectAttributes.addFlashAttribute("msg", "전자 서명을 먼저 등록해주세요");
			redirectAttributes.addFlashAttribute("url", "/myInfo");
			return "redirect:/draft/detail/basic/" + draNo;
		} else if (!approvalActionService.isAccessByFinalApproval(draNo)) {
			return "login";
		}
		approvalActionService.getUpdateFinalApproval(draNo);
		return "redirect:/draft/detail/basic/" + draNo;
	}

	// 중간결재자 승인
	@GetMapping("/mid-approval/{draNo}")
	public String midApproval(@PathVariable int draNo, RedirectAttributes redirectAttributes) {
		int findSignByEmpNo = approvalActionService.getFindSignByEmpNo();
		log.debug("findSignByEmpNo = {}", findSignByEmpNo);
		if (findSignByEmpNo != 1) {
			redirectAttributes.addFlashAttribute("msg", "전자 서명을 먼저 등록해주세요");
			redirectAttributes.addFlashAttribute("url", "/myInfo");
			return "redirect:/draft/detail/basic/" + draNo;
		} else if (!approvalActionService.isAccessBymidApproval(draNo)) {
			return "login";
		}
		approvalActionService.getUpdateMidApproval(draNo);
		return "redirect:/draft/detail/basic/" + draNo;
	}
}
