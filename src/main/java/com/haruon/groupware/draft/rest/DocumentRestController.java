package com.haruon.groupware.draft.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.draft.dto.response.ResponseDraft;
import com.haruon.groupware.draft.dto.response.ResponseReferencesList;
import com.haruon.groupware.draft.service.DeleteService;
import com.haruon.groupware.draft.service.DraftService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class DocumentRestController {

	private final DraftService draftService;
	private final DeleteService deleteService;
	public DocumentRestController(DraftService draftService, DeleteService deleteService) {
		this.draftService = draftService;
		this.deleteService = deleteService;
	}
	// 결재문서 첨부파일 삭제
	@DeleteMapping("{type}/delete/{drafNo}/file/{draNo}")
	public ResponseEntity<Void> deleteFile(@PathVariable String type, @PathVariable int draNo ,@PathVariable int drafNo){
		// 유효성검사
		if (!draftService.isAccess(draNo)) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		String path = "/home/ubuntu/upload/draft/";
		log.debug("draNo = {} drafNo = {}", draNo, drafNo);
		deleteService.getDeleteFile(drafNo, path);
		return ResponseEntity.ok().build();
	}
	
	// 기안한 문서
	@GetMapping("/drafts")
	public ResponseEntity<Map<String, Object>> draftList(@RequestParam int start, @RequestParam int length, @RequestParam(required = false, name = "search[value]") String search, @RequestParam(required = false) Integer draw) {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		List<ResponseDraft> draftByPage = draftService.getDraftByPage(empNo, search, start, length);
		int recordsFiltered = draftService.getSearchDraftCount(empNo, search);
		Map<String, Object> response = new HashMap<>();
	    response.put("draw", draw);
	    response.put("recordsTotal", recordsFiltered);
	    response.put("recordsFiltered", recordsFiltered); 
	    response.put("data", draftByPage);
	    log.debug(response.toString());
	    
		return ResponseEntity.ok(response);
	}
	// 결재할 문서
	@GetMapping("/approvals")
	public ResponseEntity<Map<String,Object>> approvalList(@RequestParam Integer start, @RequestParam Integer length, @RequestParam(required = false, name = "search[value]") String search, @RequestParam(required = false) Integer draw) {
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		List<ResponseDraft> draftByApproval = draftService.getDraftByApproval(empNo, search, start, length);
		Integer recordsFiltered = draftService.getSearchApprovalCount(empNo, search);
		log.debug("draftByApproval = {}",draftByApproval.toString());
		Map<String, Object> response = new HashMap<>();
	    response.put("draw", draw);
	    response.put("recordsTotal", recordsFiltered);
	    response.put("recordsFiltered", recordsFiltered); 
	    response.put("data", draftByApproval);
	    
		return ResponseEntity.ok(response);
	}
	
	// 참조 문서
	@GetMapping("/refers")
	public ResponseEntity<Map<String,Object>> referenceList(@RequestParam int start, @RequestParam int length, @RequestParam(required = false, name = "search[value]") String search, @RequestParam(required = false) Integer draw){
		CustomUserDetails details = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = details.getEmpNo();
		List<ResponseReferencesList> referenceList = draftService.getReferencesByEmp(empNo, search, start, length);
		Integer recordsFiltered = draftService.getSearchReferencesCount(empNo, search);
		Map<String, Object> response = new HashMap<>();
	    response.put("draw", draw);
	    response.put("recordsTotal", recordsFiltered);
	    response.put("recordsFiltered", recordsFiltered); 
	    response.put("data", referenceList);
	    
		return ResponseEntity.ok(response);
	}
}
