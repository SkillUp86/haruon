package com.haruon.groupware.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping({"/","/home"})
	public String home() {

		// 개발1 + 개발2 + 개발2_1
		return "/home";
	}
}
