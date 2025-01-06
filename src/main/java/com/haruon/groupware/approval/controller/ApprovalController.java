package com.haruon.groupware.approval.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;

@Controller
public class ApprovalController {
	
	private final ApprovalService approvalService;
	private final DeptService deptService;
	
	public ApprovalController(ApprovalService approvalService, DeptService deptService) {
		this.approvalService = approvalService;
		this.deptService = deptService;
	}

	@GetMapping("/approval")
	public String approval(Model model) {
		// 전자결재 코드
		String parentCode = "C00";
		List<CommonCode> codeList = approvalService.findByParentCode(parentCode);
		List<Dept> deptList = deptService.findByAll();
		model.addAttribute("codeList", codeList);
		model.addAttribute("deptList", deptList);
		
		return "/approval/approval";
	}

}
