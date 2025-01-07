package com.haruon.groupware.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.board.service.BoardService;
import com.haruon.groupware.category.entity.Category;
import com.haruon.groupware.category.service.CategoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired BoardService boardService;
	@Autowired CategoryService categoryService;
	
	// /board
	@GetMapping("/board")
	public String boardList(Model model) {
		List<Map<String,Object>> boardList = boardService.getBoardList();
		
		model.addAttribute("boardList", boardList);
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
	
		return "/board/board";
	}
}
