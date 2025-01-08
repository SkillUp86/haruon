package com.haruon.groupware.franchise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.franchise.entity.Franchise;
import com.haruon.groupware.franchise.service.FranchiseService;
import com.haruon.groupware.franchise.util.PageUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FranchiseController {
	@Autowired FranchiseService franchiseService;
	
	
	// 가맹점 추가
	@GetMapping("/franchises/insert")
	public String insertFranchise() {
		return "franchises/insertFranchise";
	}
	
	@PostMapping("/franchises/insert")
	public String insertFranchise(Franchise franchise) {
		return "redirect://franchises";
	}
	
	// 가맹점 리스트
	@GetMapping("/franchises")
	public String franchises(Model model) {
		List<Franchise> franchiseList = franchiseService.getFranchiseList();
		model.addAttribute("franchiseList", franchiseList);

		log.debug("franchiseList ----->" + franchiseList);
		
		return "franchises/franchises";
	}
}
