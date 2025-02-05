package com.haruon.groupware.approval.controller;

import java.util.List;

import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.auth.CustomUserDetails;
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
	public String insertApproval(@Valid RequestApproval approval, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		log.debug(approval.toString());
		if (bindingResult.hasErrors()) {
			redirectAttributes.addAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "redirect:/approval";
		}

		List<MultipartFile> list = approval.getFormFile();
		if (list != null && !list.isEmpty()) {
			for (MultipartFile f : list) {
				if (f.isEmpty()) {
					continue;
				}
				 if (f.getSize() > 10 * 1024 * 1024) {
					 redirectAttributes.addAttribute("msg", "첨부파일 크기는 10MB를 초과할 수 없습니다.");
		                return "redirect:/approval";
		            }
				if (!f.getContentType().equals("image/jpeg") && !f.getContentType().equals("image/png") && !f.getContentType().equals("application/pdf")) {
					redirectAttributes.addAttribute("msg", "이미지 파일,pdf 만 입력이 가능합니다");
					return "redirect:/approval";
				}
			}
		}

		String path ="/home/ubuntu/upload/draft/";
		approvalService.addApproval(approval, path);
		redirectAttributes.addAttribute("successMsg", "결재문서 작성 완료.");
		return "redirect:/approval";
	}

	@GetMapping("/approval")
	public String approval(Authentication authentication, Model model) {
		
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		String empName = userDetails.getEname();
		int empNo = userDetails.getEmpNo();
		String dname = userDetails.getDname();

		// 전자결재 코드
		String parentCode = "C00";
		List<CommonCode> codeList = approvalService.findByParentCode(parentCode);
		// 부서
		List<Dept> deptList = deptService.findByAll();
		// 가맹점 리스트
		List<ResponseFranchise> franchiseList = approvalService.findByFranchise();
		// 휴가 코드
		String vacationCode = "H00";
		List<CommonCode> vacationList = approvalService.findByParentCode(vacationCode);

		model.addAttribute("codeList", codeList);
		model.addAttribute("vacationList", vacationList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("franchiseList", franchiseList);
		model.addAttribute("empNo", empNo);
		model.addAttribute("empName", empName);
		model.addAttribute("dname", dname);

		return "approval/approval";
	}

}
