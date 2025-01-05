package com.haruon.groupware.approval.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.common.entity.CommonCode;

@Controller
public class ApprovalController {
	
	private final ApprovalService approvalService;
	
	public ApprovalController(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@GetMapping("/approval")
	public String approval(Model model) {
		// 전자결재 코드
		String parentCode = "C00";
		List<CommonCode> codeList = approvalService.findByParentCode(parentCode);
		model.addAttribute("codeList", codeList);
		return "/approval/approval";
	}

}
