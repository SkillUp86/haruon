package com.haruon.groupware.draft.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.draft.dto.RequestUpdateBasicDraft;
import com.haruon.groupware.draft.dto.ResponseBasicDraftDetail;
import com.haruon.groupware.draft.service.DraftService;
import com.haruon.groupware.draft.service.UpdateService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UpdateController {
	private final DraftService draftService;
	private final UpdateService updateService;
	
	public UpdateController(DraftService draftService, UpdateService updateService) {
		this.draftService = draftService;
		this.updateService = updateService;
	}
	
	@PostMapping("/update/basicDraft")
	public String updateBasicDraft(RequestUpdateBasicDraft basicDraft, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		updateService.getUpdateBasicDraft(basicDraft, path);
		return "redirect:/draft/detail/basic/"+basicDraft.getDraNo();
	}

	@GetMapping("/draft/update/basic")
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
