package com.haruon.groupware.approval.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

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
	public String insertApproval(@ModelAttribute RequestApproval approval, Model model, HttpSession session) {
		log.debug(approval.toString());
		List<MultipartFile> list = approval.getFormFile();
		if (list != null && !list.isEmpty()) {
			boolean existFilename = false;
			for (MultipartFile f : list) {
				if (f.isEmpty()) {
					continue; // 비어 있는 파일은 넘김
				}
				 if (f.getSize() > 10 * 1024 * 1024) {
		                model.addAttribute("msg", "첨부파일 크기는 10MB를 초과할 수 없습니다.");
		                return "/approval/approval";
		            }
				if (!f.getContentType().equals("image/jpeg") && !f.getContentType().equals("image/png") && !f.getContentType().equals("application/pdf")) {
					model.addAttribute("msg", "이미지 파일,pdf 만 입력이 가능합니다");
					return "/approval/approval";
				}
			}
		}

		String path = session.getServletContext().getRealPath("/uploadDraft/");
		approvalService.addApproval(approval, path);

		return "redirect:/";
	}

	@GetMapping("/approval")
	public String approval(HttpSession session, Model model) {
		String empName = (String) session.getAttribute("loginEmpName");
		int empNo = (int) session.getAttribute("loginEmpNo");
		String location = (String) session.getAttribute("loginEmpLocation");
		String dname = (String) session.getAttribute("loginDname");

		log.debug("location:" + location);

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
