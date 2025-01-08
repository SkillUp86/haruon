package com.haruon.groupware.approval.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ApprovalController {
	
	private final ApprovalService approvalService;
	private final DeptService deptService;
	
	public ApprovalController(ApprovalService approvalService, DeptService deptService) {
		this.approvalService = approvalService;
		this.deptService = deptService;
	}
	
	@PostMapping("/approval")
	public String insertApproval(@ModelAttribute RequestApproval approval) {
		log.debug(approval.toString());
		
		
		return "";
	}

	@GetMapping("/approval")
	public String approval(HttpSession session,Model model) {
		String empName = (String)session.getAttribute("loginEmpName");
		int empNo = (int)session.getAttribute("loginEmpNo");
		String location = (String)session.getAttribute("loginEmpLocation");
		String dname = (String)session.getAttribute("loginDname");
		
		log.debug("location:"+location);
		
		// 전자결재 코드
		String parentCode = "C00";
		List<CommonCode> codeList = approvalService.findByParentCode(parentCode);
		// 부서
		List<Dept> deptList = deptService.findByAll();
		// 가맹점 리스트
		List<ResponseFranchise> franchiseList = approvalService.findByFranchise();
		// 휴가 코드
		String vactionCode = "H00";
		List<CommonCode> vactionList = approvalService.findByParentCode(vactionCode);
		
		
		model.addAttribute("codeList", codeList);
		model.addAttribute("vactionList", vactionList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("franchiseList", franchiseList);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empName", empName);
		model.addAttribute("dname", dname);
		
		return "/approval/approval";
	}

}
