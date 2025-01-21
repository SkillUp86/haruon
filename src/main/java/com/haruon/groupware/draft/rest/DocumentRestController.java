package com.haruon.groupware.draft.rest;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.draft.dto.response.ResponseDraft;
import com.haruon.groupware.draft.dto.response.ResponseReferencesList;
import com.haruon.groupware.draft.service.DraftService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class DocumentRestController {

	private final DraftService draftService;
	
	public DocumentRestController(DraftService draftService) {
		this.draftService = draftService;
	}
	// 기안한 문서
	@GetMapping("/drafts/{empNo}")
	public ResponseEntity<List<ResponseDraft>> draftList(@PathVariable int empNo) {
		List<ResponseDraft> draftByPage = draftService.getDraftByPage(empNo);
		return ResponseEntity.ok(draftByPage);
	}
	// 결재할 문서
	@GetMapping("/approvals/{empNo}")
	public ResponseEntity<List<ResponseDraft>> approvalList(@PathVariable int empNo) {
		List<ResponseDraft> draftByApproval = draftService.getDraftByApproval(empNo);
		log.debug("draftByApproval = {}",draftByApproval.toString());
		return ResponseEntity.ok(draftByApproval);
	}
	
	// 참조 문서
	@GetMapping("/refers/{empNo}")
	public ResponseEntity<List<ResponseReferencesList>> referenceList(@PathVariable int empNo){
		List<ResponseReferencesList> referenceList = draftService.getReferencesByEmp(empNo);
		return ResponseEntity.ok(referenceList);
	}
}
