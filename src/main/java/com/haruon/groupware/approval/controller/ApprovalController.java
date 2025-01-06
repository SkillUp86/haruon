package com.haruon.groupware.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApprovalController {
	
	@GetMapping("/approval")
	public String approval() {
		return "/approval/approval";
	}

}
