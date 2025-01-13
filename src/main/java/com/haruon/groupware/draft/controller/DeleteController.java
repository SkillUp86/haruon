package com.haruon.groupware.draft.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
/*
 * 기안문서가 결재대기 상태일때만 가능한 삭제 컨트롤러임
 */
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.draft.service.DeleteService;
import com.haruon.groupware.draft.service.DraftService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DeleteController {
	private final DeleteService deleteService;
	private final DraftService draftService;

	public DeleteController(DeleteService deleteService, DraftService draftService) {
		this.deleteService = deleteService;
		this.draftService = draftService;
	}

	@GetMapping("/draft/delete")
	public String deleteBasicDraft(@RequestParam int draNo, @RequestParam int appNo, @RequestParam String docType, HttpSession session, Authentication authentication) {
		// 유효성검사
		CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
		int empNo = details.getEmpNo();
		if (!draftService.hasAccess(draNo, empNo)) {
			return "login";
		}
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		deleteService.getDeleteDraft(docType, draNo, appNo, path);
		return "redirect:/draft/list";

	}
	
	@GetMapping("/deleteFile/basic")
	public String deleteFileByBasic(@RequestParam int draNo, @RequestParam int drafNo, HttpSession session) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		log.debug("draNo = {} drafNo = {}",draNo,drafNo);
		deleteService.getDeleteFile(drafNo, path);
		return "redirect:/draft/update/basic?draNo="+draNo;
	}

}
