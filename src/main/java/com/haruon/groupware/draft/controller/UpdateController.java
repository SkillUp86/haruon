package com.haruon.groupware.draft.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.draft.dto.request.RequestUpdateBasicDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateBusinessDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateSalesDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateVacationDraft;
import com.haruon.groupware.draft.dto.response.ResponseBasicDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseBusinessDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseSalesDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseVacationDraftDetail;
import com.haruon.groupware.draft.service.DraftService;
import com.haruon.groupware.draft.service.UpdateService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/draft")
public class UpdateController {
	private final DraftService draftService;
	private final UpdateService updateService;
	private final ApprovalService approvalService;
	private final DeptService deptService;

	public UpdateController(DraftService draftService, UpdateService updateService, ApprovalService approvalService,
			DeptService deptService) {
		this.draftService = draftService;
		this.updateService = updateService;
		this.approvalService = approvalService;
		this.deptService = deptService;
	}

	@PostMapping("/update/vacationDraft")
	public String updateVacationDraft(RequestUpdateVacationDraft vacationDraft, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		updateService.getUpdateVacationDraft(vacationDraft, path);
		return "redirect:/draft/detail/vacation/" + vacationDraft.getDraNo();
	}

	// 휴가보고서 수정
	@GetMapping("/update/vacation")
	public String updateVacationDraft(@RequestParam int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseVacationDraftDetail draftDetail = draftService.getVacationDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		// 부서
		List<Dept> deptList = deptService.findByAll();
		// 휴가 코드
		String vactionCode = "H00";
		List<CommonCode> vactionList = approvalService.findByParentCode(vactionCode);

		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		model.addAttribute("deptList", deptList);
		model.addAttribute("vactionList", vactionList);
		return "draft/updateVacation";
	}

	@PostMapping("/update/salesDraft")
	public String updateSalesDraft(RequestUpdateSalesDraft salesDraft, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		updateService.getUpdateSalesDraft(salesDraft, path);
		return "redirect:/draft/detail/sales/" + salesDraft.getDraNo();
	}

	// 매출보고서 수정
	@GetMapping("/update/sales")
	public String updateSalesDraft(@RequestParam int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseSalesDraftDetail draftDetail = draftService.getSalesDraftDetail(draNo);
		List<ResponseFranchise> franchiseList = approvalService.findByFranchise();
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		model.addAttribute("d", draftDetail);
		model.addAttribute("franchiseList", franchiseList);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/updateSales";
	}

	@PostMapping("/update/businessDraft")
	public String updateBusinessDraft(RequestUpdateBusinessDraft businessDraft, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		updateService.getUpdateBusinessDraft(businessDraft, path);
		return "redirect:/draft/detail/business/" + businessDraft.getDraNo();
	}

	// 출장 기안서 수정
	@GetMapping("/update/business")
	public String updateBusinessDraft(@RequestParam int draNo, Model model, Authentication authentication) {
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
		return "draft/updateBusiness";
	}

	@PostMapping("/update/basicDraft")
	public String updateBasicDraft(RequestUpdateBasicDraft basicDraft, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		updateService.getUpdateBasicDraft(basicDraft, path);
		return "redirect:/draft/detail/basic/" + basicDraft.getDraNo();
	}

	// 기본 기안서 수정
	@GetMapping("/update/basic")
	public String updateBasicDraft(@RequestParam int draNo, Model model, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		ResponseBasicDraftDetail draftDetail = draftService.getBasicDraftDetail(draNo);
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return "draft/updateBasic";
	}

}
