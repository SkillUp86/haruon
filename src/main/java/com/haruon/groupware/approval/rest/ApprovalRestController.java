package com.haruon.groupware.approval.rest;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.approval.dto.EmployeeResponse;
import com.haruon.groupware.approval.service.ApprovalService;

@RestController
public class ApprovalRestController {
	
	private final ApprovalService approvalService;
	
	public ApprovalRestController(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@GetMapping("approval/depts/{deptNo}/employees")
	public ResponseEntity<List<EmployeeResponse>> empList(@PathVariable int deptNo) {
		List<EmployeeResponse> empByDept = approvalService.findEmpByDept(deptNo);
		return ResponseEntity.ok(empByDept);
		
	}
}
