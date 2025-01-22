package com.haruon.groupware.approval.rest;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.auth.CustomUserDetails;

@RestController
public class ApprovalRestController {
	
	private final ApprovalService approvalService;
	
	public ApprovalRestController(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@GetMapping("approval/depts/{deptNo}/employees")
	public ResponseEntity<List<ResponseEmployee>> empList(@PathVariable int deptNo,Authentication authentication) {
		CustomUserDetails details = (CustomUserDetails)authentication.getPrincipal();
		
		int empNo = details.getEmpNo();
		List<ResponseEmployee> empByDept = approvalService.findEmpByDept(deptNo,empNo);
		return ResponseEntity.ok(empByDept);
		
	}
}
