package com.haruon.groupware.franchise.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.franchise.entity.Franchise;
import com.haruon.groupware.franchise.service.FranchiseService;

@RestController
public class FranchiseRestController {
	@Autowired FranchiseService franchiseService;
	
	@GetMapping("/franchises/brief")
	public ResponseEntity<List<Franchise>> getFranchisesList() {
		List<Franchise> franchiseList = franchiseService.getFranchiseList();
		return ResponseEntity.ok(franchiseList);
	}
	
	@GetMapping("/franchise/{fraNo}/brief")
	public ResponseEntity<Franchise> getFranchisesList(@PathVariable Integer fraNo) {
		Franchise franchiseInfo = franchiseService.getFranchise(fraNo);
		return ResponseEntity.ok(franchiseInfo);
	}

}
