package com.haruon.groupware.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.category.entity.Category;
import com.haruon.groupware.category.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	@GetMapping("/categories")
	public String getAllCategory(Model model){
		List<Category> categoryList = categoryService.getAllCategory();;
		model.addAttribute("categoryList", categoryList);
		
		return "/board/categories";
	}
}
