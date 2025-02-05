	package com.haruon.groupware.draft.controller;

import java.util.List;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.draft.dto.request.RequestUpdateBasicDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateBusinessDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateSalesDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateVacationDraft;
import com.haruon.groupware.draft.service.DraftService;
import com.haruon.groupware.draft.service.UpdateService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
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

	@GetMapping("/{type}/update/{draNo}")
	public String updateDraft(@PathVariable String type, @PathVariable int draNo, Model model) {
		// 유효성검사
		if (!draftService.isAccess(draNo)) {
			return "login";
		}
		Object draftDetail = null;
		String url = null;

		switch (type) {
		case "C01": // 휴가
			draftDetail = draftService.getBasicDraftDetail(draNo);
			url = "draft/updateBasic";
			break;
		case "C02": // 출장
			draftDetail = draftService.getBusinessDraftDetail(draNo);
			url = "draft/updateBusiness";
			break;
		case "C03": // 매출
			draftDetail = draftService.getSalesDraftDetail(draNo);
			List<ResponseFranchise> franchiseList = approvalService.findByFranchise();
			model.addAttribute("franchiseList", franchiseList);
			url = "draft/updateSales";
			break;
		case "C04": // 휴가
			draftDetail = draftService.getVacationDraftDetail(draNo);
			// 부서
			List<Dept> deptList = deptService.findByAll();
			// 휴가 코드
			String vactionCode = "H00";
			List<CommonCode> vactionList = approvalService.findByParentCode(vactionCode);

			model.addAttribute("deptList", deptList);
			model.addAttribute("vactionList", vactionList);
			url = "draft/updateVacation";
			break;
		default:
			throw new IllegalArgumentException("없는 유형의 타입입니다. ");
		}
		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);

		model.addAttribute("d", draftDetail);
		model.addAttribute("draftFiles", draftFiles);
		return url;
	}

	// 공통 로직 묶기
	private String isAccess(Integer draNo) {
		// 유효성검사
		if (!draftService.isAccess(draNo)) {
			return "login";
		}
		String path = "/home/ubuntu/upload/draft/";
		return path;
	}

	@PostMapping("/update/vacationDraft")
	public String updateVacationDraft(@Valid RequestUpdateVacationDraft vacationDraft, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()) {
			redirectAttributes.addFlashAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "redirect:/draft/"+vacationDraft.getType()+"/update/"+vacationDraft.getDraNo();
		}
		Integer draNo = vacationDraft.getDraNo();
		String path = isAccess(draNo);
		updateService.getUpdateVacationDraft(vacationDraft, path);
		return "redirect:/draft/"+vacationDraft.getType()+"/detail/" + vacationDraft.getDraNo();
	}

	@PostMapping("/update/salesDraft")
	public String updateSalesDraft(@Valid RequestUpdateSalesDraft salesDraft, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()) {

			redirectAttributes.addFlashAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "redirect:/draft/"+salesDraft.getType()+"/update/" + salesDraft.getDraNo();
		}
		Integer draNo = salesDraft.getDraNo();
		String path = isAccess(draNo);
		updateService.getUpdateSalesDraft(salesDraft, path);
		return "redirect:/draft/"+salesDraft.getType()+"/detail/" + salesDraft.getDraNo();
	}

	@PostMapping("/update/businessDraft")
	public String updateBusinessDraft(@Valid RequestUpdateBusinessDraft businessDraft, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()) {
			redirectAttributes.addFlashAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "redirect:/draft/"+businessDraft.getType()+"/update/" + businessDraft.getDraNo();
		}
		Integer draNo = businessDraft.getDraNo();
		String path = isAccess(draNo);
		updateService.getUpdateBusinessDraft(businessDraft, path);
		return "redirect:/draft/"+businessDraft.getType()+"/detail/" + businessDraft.getDraNo();
	}

	@PostMapping("/update/basicDraft")
	public String updateBasicDraft(@Valid RequestUpdateBasicDraft basicDraft, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()) {
			redirectAttributes.addFlashAttribute("msg", bindingResult.getFieldError().getDefaultMessage());
			return "redirect:/draft/"+basicDraft.getType()+"/update/" + basicDraft.getDraNo();
		}
		Integer draNo = basicDraft.getDraNo();
		String path = isAccess(draNo);
		updateService.getUpdateBasicDraft(basicDraft, path);
		return "redirect:/draft/"+basicDraft.getType()+"/detail/" + basicDraft.getDraNo();
	}

	// 매출보고서 수정
//	@GetMapping("/update/sales")
//	public String updateSalesDraft(@RequestParam int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		ResponseSalesDraftDetail draftDetail = draftService.getSalesDraftDetail(draNo);
//		List<ResponseFranchise> franchiseList = approvalService.findByFranchise();
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("franchiseList", franchiseList);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/updateSales";
//	}

	// 출장 기안서 수정
//	@GetMapping("/update/business")
//	public String updateBusinessDraft(@RequestParam int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		ResponseBusinessDraftDetail draftDetail = draftService.getBusinessDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/updateBusiness";
//	}
	// 휴가보고서 수정
//	@GetMapping("/update/vacation")
//	public String updateVacationDraft(@RequestParam int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		ResponseVacationDraftDetail draftDetail = draftService.getVacationDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		// 부서
//		List<Dept> deptList = deptService.findByAll();
//		// 휴가 코드
//		String vactionCode = "H00";
//		List<CommonCode> vactionList = approvalService.findByParentCode(vactionCode);
//
//		model.addAttribute("deptList", deptList);
//		model.addAttribute("vactionList", vactionList);
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/updateVacation";
//	}

	// 기본 기안서 수정
//	@GetMapping("/update/basic")
//	public String updateBasicDraft(@RequestParam int draNo, Model model) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		ResponseBasicDraftDetail draftDetail = draftService.getBasicDraftDetail(draNo);
//		List<DraftFileEntity> draftFiles = draftService.getDraftFiles(draNo);
//		model.addAttribute("d", draftDetail);
//		model.addAttribute("draftFiles", draftFiles);
//		return "draft/updateBasic";
//	}

}
