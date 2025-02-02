package com.haruon.groupware.franchise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.franchise.entity.Franchise;
import com.haruon.groupware.franchise.service.FranchiseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FranchiseController {
	@Autowired FranchiseService franchiseService;
	
	// 가맹점 수정
	@GetMapping("/franchises/modify")
	public String modifyFranchise(@RequestParam Integer fraNo, Model model) {
		Franchise franchise = franchiseService.getFranchise(fraNo);
		model.addAttribute("f", franchise);
		return "franchise/modify";
	}
	
	@PostMapping("/franchises/modify")
	public String modifyFranchise(Franchise franchise) {
		franchiseService.modifyFranchise(franchise);
		return "redirect:/franchises";
	}
	
	// 가맹점 등록
	@GetMapping("/franchises/insert")
	public String insertFranchise() {
		return "franchise/insert";
	}
	
	@PostMapping("/franchises/insert")
	public String insertFranchise(Franchise franchise) {
		franchiseService.addFranchise(franchise);
		return "redirect:/franchises";
	}
	
	// 가맹점 리스트
	@GetMapping("/franchises")
	public String franchises() {
		return "franchise/franchises";
	}
}
