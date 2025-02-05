package com.haruon.groupware.draft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import com.haruon.groupware.draft.service.DeleteService;
import com.haruon.groupware.draft.service.DraftService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

/*
 * 기안문서가 결재대기 상태일때만 가능한 삭제 컨트롤러임
 */
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
	public String deleteDraft(@RequestParam int draNo, @RequestParam int appNo, @RequestParam String docType,
			HttpSession session) {
		// 유효성검사
		if (!draftService.isAccess(draNo)) {
			return "login";
		}
		String path = "/home/ubuntu/upload/draft/";
		deleteService.getDeleteDraft(docType, draNo, appNo, path);
		return "redirect:/draft/list";

	}
//	// 기안서 파일 삭제 -> restController 로 이동
//	@GetMapping("{type}/delete/{drafNo}/file/{draNo}")
//	public String deleteFile(@PathVariable String type, @PathVariable int draNo ,@PathVariable int drafNo, HttpSession session) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		String path = session.getServletContext().getRealPath("/upload/draft/");
//		log.debug("draNo = {} drafNo = {}", draNo, drafNo);
//			deleteService.getDeleteFile(drafNo, path);
//		return "redirect:/draft/"+type+"/update/"+draNo;
//	}

//	// 휴가 기안서 파일 삭제
//	@GetMapping("/deleteFile/vacation")
//	public String deleteFileByVacation(@RequestParam int draNo, @RequestParam int drafNo, HttpSession session) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		String path = session.getServletContext().getRealPath("/upload/draft/");
//		log.debug("draNo = {} drafNo = {}", draNo, drafNo);
//		deleteService.getDeleteFile(drafNo, path);
//		return "redirect:/draft/update/vacation?draNo=" + draNo;
//	}
//
//	// 매출 기안서 파일 삭제
//	@GetMapping("/deleteFile/sales")
//	public String deleteFileBySales(@RequestParam int draNo, @RequestParam int drafNo, HttpSession session) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		String path = session.getServletContext().getRealPath("/upload/draft/");
//		log.debug("draNo = {} drafNo = {}", draNo, drafNo);
//		deleteService.getDeleteFile(drafNo, path);
//		return "redirect:/draft/update/sales?draNo=" + draNo;
//	}
//
//	// 출장 기안서 파일 삭제
//	@GetMapping("/deleteFile/business")
//	public String deleteFileByBusiness(@RequestParam int draNo, @RequestParam int drafNo, HttpSession session) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		String path = session.getServletContext().getRealPath("/upload/draft/");
//		log.debug("draNo = {} drafNo = {}", draNo, drafNo);
//		deleteService.getDeleteFile(drafNo, path);
//		return "redirect:/draft/update/business?draNo=" + draNo;
//	}
//
//	// 기본 기안서 파일삭제
//	@GetMapping("/deleteFile/basic")
//	public String deleteFileByBasic(@RequestParam int draNo, @RequestParam int drafNo, HttpSession session) {
//		// 유효성검사
//		if (!draftService.isAccess(draNo)) {
//			return "login";
//		}
//		String path = session.getServletContext().getRealPath("/upload/draft/");
//		log.debug("draNo = {} drafNo = {}", draNo, drafNo);
//		deleteService.getDeleteFile(drafNo, path);
//		return "redirect:/draft/update/basic?draNo=" + draNo;
//	}

}
