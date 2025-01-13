package com.haruon.groupware.department.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;

@Controller
public class DeptController {
	@Autowired DeptService deptService;
	
	// 부서 리스트
	@GetMapping("/depts")
	public String getDeptList(Model model) {
		List<Dept> deptList = deptService.getDeptList();
		model.addAttribute("deptList",deptList);
		
		return "/dept/depts";
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
	public String updateDept(@RequestParam Integer deptNo, @RequestParam String dname) {
		Dept dept = new Dept();
		dept.setDepNo(deptNo);
		dept.setDname(dname);
		deptService.updateDept(dept);
		
		return "redirect:/depts";
	}
	
	// 부서 활성화/비활성화
	@PostMapping("/depts/updateActive")
	public String updateDeptActive(@RequestParam Integer deptNo, @RequestParam String activeYn) {
		Dept dept = new Dept();
		dept.setDepNo(deptNo);
		dept.setActiveYn(activeYn);
		deptService.updateDept(dept);
		
		return "redirect:/depts";
	}
}
