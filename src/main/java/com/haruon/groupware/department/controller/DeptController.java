package com.haruon.groupware.department.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;

@Controller
public class DeptController {
	@Autowired DeptService deptService;
	
	// 조직도
	@GetMapping("/depts/chart")
	public String deptChart(Model model) {
		List<Map<String,Object>> deptList = deptService.getDeptHead();
		
		// deptList를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	    	String deptListJson = objectMapper.writeValueAsString(deptList)
				    		    .replaceAll("\"", "&quot;")
				    		    .replaceAll("'", "&#39;")
				    		    .replaceAll("<", "&lt;")
				    		    .replaceAll(">", "&gt;");
	        model.addAttribute("deptListJson", deptListJson);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return "dept/chart";
	}
	
	// 부서 리스트
	@GetMapping("/depts")
	public String getDeptList(Model model) {
		List<Dept> deptList = deptService.getDeptList();
		model.addAttribute("deptList",deptList);
		
		return "dept/depts";
	}
	
	// 부서 등록
	@PostMapping("/depts/insert")
	public String insertDept(@RequestParam String dname) {
		Dept dept = new Dept();
		dept.setDname(dname);
		deptService.insertDept(dept);
		
		return "redirect:/depts";
	}
	
	// 부서 수정
	@PostMapping("/depts/update")
	public String updateDept(@RequestParam Integer depNo, @RequestParam String dname) {
		Dept dept = new Dept();
		dept.setDepNo(depNo);
		dept.setDname(dname);
		deptService.updateDept(dept);
		
		return "redirect:/depts";
	}
	
	// 부서 활성화/비활성화
	@PostMapping("/depts/activeYN")
	public String activeYN(@RequestParam Integer depNo, @RequestParam String activeYn) {
		Dept dept = new Dept();
		dept.setDepNo(depNo);
		dept.setActiveYn(activeYn);
		deptService.updateDept(dept);
		
		return "redirect:/depts";
	}
}
