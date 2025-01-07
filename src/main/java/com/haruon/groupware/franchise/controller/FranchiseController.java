package com.haruon.groupware.franchise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.franchise.entity.Franchise;
import com.haruon.groupware.franchise.service.FranchiseService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FranchiseController {
	@Autowired FranchiseService franchiseService;
	
	@GetMapping("/franchises")
	public String franchises(Model model) {
		List<Franchise> franchiseList = franchiseService.getFranchiseList();
		model.addAttribute("franchiseList", franchiseList);
		
		return "franchise/franchises";
	}
}
