package com.haruon.groupware.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.board.dto.BoardDto;
import com.haruon.groupware.board.service.BoardService;
import com.haruon.groupware.category.entity.Category;
import com.haruon.groupware.category.service.CategoryService;

import jakarta.servlet.http.HttpSession;
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
	
	// /board/{boaNo}
	@GetMapping("/board/{boaNo}")
    public String getBoardDetail(@PathVariable Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
        List<Map<String,Object>> commentList = boardService.getCommentList(boaNo);
        model.addAttribute("commentList",commentList);
        
        Integer countCommnet = boardService.countComment(boaNo);
        model.addAttribute("countCommnet",countCommnet);
        
        Integer countLike = boardService.countLike(boaNo);
        model.addAttribute("countLike",countLike);
        
        return "/board/boardOne";
    }
	
	// /board/notice
	@GetMapping("/board/notice")
	public String noticeList(Model model) {
		List<Map<String,Object>> noticeList = boardService.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		return "/board/notice";
	}
	
	// /board/insert
	@PostMapping("/board/insert")
	public String insertBoard(HttpSession session,Model model, BoardDto boardDto) {
		List<MultipartFile> list = boardDto.getBoardFile();
		if(list != null && list.size()!=0) {
				return "/board/insert";
		}
		String path = session.getServletContext().getRealPath("/upload/");
		boardService.insertBoard(boardDto, path);
		
		return "redirect:/board";
	}
	
}
