package com.haruon.groupware.draft.controller;

import org.springframework.stereotype.Controller;
/*
 * 기안문서가 결재대기 상태일때만 가능한 삭제 컨트롤러임
 */
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.draft.service.DeleteService;

import jakarta.servlet.http.HttpSession;
@Controller
public class DeleteController {
	private final DeleteService deleteService;
	
	public DeleteController(DeleteService deleteService) {
		this.deleteService = deleteService;
	}

	@GetMapping("/draft/delete")
	public String deleteBasicDraft(@RequestParam int draNo, @RequestParam int appNo, @RequestParam String docType, HttpSession session ) {
		String path = session.getServletContext().getRealPath("/uploadDraft/");
		deleteService.getDeleteDraft(docType, draNo, appNo, path);
		return "redirect:/draft/list";
	}
	
}
