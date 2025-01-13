package com.haruon.groupware.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.board.dto.BoardDto;
import com.haruon.groupware.board.entity.BoardComment;
import com.haruon.groupware.board.entity.BoardFile;
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
	
/* 자유 */
	// 자유 게시판 리스트
	@GetMapping("/board")
	public String getBoardList(Model model) {
		List<Map<String,Object>> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		
		List<Category> categoryList = categoryService.getCategoryListFree();
		model.addAttribute("categoryList", categoryList);
	
		return "board/board";
	}
	
	// 게시글 상세
	@GetMapping("/board/{boaNo}")
    public String getBoardOne(@PathVariable Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
        // 댓글 리스트
        List<Map<String,Object>> commentList = boardService.getCommentList(boaNo);
        model.addAttribute("commentList",commentList);
        
        // 댓글 수
        Integer countCommnet = boardService.countComment(boaNo);
        model.addAttribute("countCommnet",countCommnet);
        
        // 추천 수
        Integer countLike = boardService.countLike(boaNo);
        model.addAttribute("countLike",countLike);
        
        // 첨부파일 리스트
        List<BoardFile> boardFiles = boardService.getBoardFiles(boaNo);
		model.addAttribute("boardFiles", boardFiles);
        
        return "board/boardOne";
    }
	
	// 댓글 입력
	@PostMapping("/board/comment")
	public String insertComment(@RequestParam Integer boaNo, @RequestParam String content) {
		BoardComment boardComment = new BoardComment();
	    boardComment.setBoaNo(boaNo);
	    boardComment.setContent(content);
	    // boardComment.setEmpNo(로그인empNo); 
	    
		boardService.insertComment(boardComment);
		return "redirect:/board/"+ boaNo;
	}
	
	// 댓글 삭제
	@GetMapping("/board/deleteComment")
	public String deleteComment(@RequestParam Integer boaNo, @RequestParam Integer comNo) {
		boardService.deleteComment(comNo);
		return "redirect:/board/"+ boaNo;
	}
	
	// 글 입력
	@GetMapping("/board/insert")
    public String insertBoard(Model model) {
        List<Category> categoryList = categoryService.getCategoryListFree();
        model.addAttribute("categoryList", categoryList);
        
        return "board/insert";
    }
	@PostMapping("/board/insert")
	public String insertBoard(HttpSession session, BoardDto boardDto) {
		Integer empNo = (Integer) session.getAttribute("loginEmpNo");
		boardDto.setEmpNo(empNo);
		
		String path = session.getServletContext().getRealPath("/uploadBoard/");
		boardService.insertBoard(boardDto, path);
		
		return "redirect:/board";
	}
	
	// 글 수정
	@GetMapping("/board/update")
    public String updateBoard(@RequestParam Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
        List<Category> categoryList = categoryService.getCategoryListFree();
		model.addAttribute("categoryList", categoryList);
		
		List<BoardFile> boardFiles = boardService.getBoardFiles(boaNo);
		model.addAttribute("boardFiles", boardFiles);
        
        return "board/update";
    }
	@PostMapping("/board/update")
	public String updateBoard(@RequestParam Integer boaNo , @RequestParam Integer catNo, @RequestParam String title
							, @RequestParam String content, BoardDto boardDto, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		map.put("boaNo", boaNo);
		map.put("catNo", catNo);
		map.put("title", title);
		map.put("content", content);
		boardService.updateBoard(map);
		log.debug("updateBoard: "+map.toString());
		
		List<MultipartFile> list = boardDto.getBoardFile();
		if(list != null && list.size()!=0) {
				return "/board/update";
		}
		String path = session.getServletContext().getRealPath("/upload/");
		boardService.insertBoard(boardDto, path);
		
		return "redirect:/board/"+boaNo;
	}
	
/* 공지 */
	// 공지 리스트
	@GetMapping("/board/notice")
	public String noticeList(Model model) {
		List<Map<String,Object>> noticeList = boardService.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		return "board/notice";
	}
	
	// 공지 입력
	@GetMapping("/board/insertNotice")
	public String insertNotice(HttpSession session, Model model) {
		/*
		 * String empName = (String) session.getAttribute("loginEmpName"); 
		 * int empNo = (int) session.getAttribute("loginEmpNo"); 
		 * model.addAttribute("empName", empName); 
		 * model.addAttribute("empNo", empNo);
		 */
		
		return "board/insertNotice";
	}
	@PostMapping("/board/insertNotice")
	public String insertNotice(HttpSession session, BoardDto boardDto) {
		String path = session.getServletContext().getRealPath("/uploadBoard/");
		boardService.insertNotice(boardDto, path);
		
		return "redirect:/board/notice";
	}	
	
	// 공지 수정
	@GetMapping("/board/updateNotice")
    public String updateNotice(@RequestParam Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
		List<BoardFile> boardFiles = boardService.getBoardFiles(boaNo);
		model.addAttribute("boardFiles", boardFiles);
        
        return "board/updateNotice";
    }
	@PostMapping("/board/updateNotice")
	public String updateNotice(@RequestParam Integer boaNo , @RequestParam String title
							, @RequestParam String content, BoardDto boardDto, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		map.put("boaNo", boaNo);
		map.put("title", title);
		map.put("content", content);
		boardService.updateNotice(map);
		log.debug("updateBoard: "+map.toString());
		
		List<MultipartFile> list = boardDto.getBoardFile();
		if(list != null && list.size()!=0) {
				return "/board/updateNotice";
		}
		String path = session.getServletContext().getRealPath("/upload/");
		boardService.insertBoard(boardDto, path);
		
		return "redirect:/board/notice"+boaNo;
	}
	
	// 글 삭제
	@GetMapping("/board/delete")
	public String deleteBoard(HttpSession session, @RequestParam Integer boaNo) {
		String path = session.getServletContext().getRealPath("/uploadBoard/");
		boardService.deleteBoard(boaNo, path);
		return "redirect:/board";
	}
	// 공지 삭제
	@GetMapping("/board/deleteNotice")
	public String deleteNotice(HttpSession session, @RequestParam Integer boaNo) {
		String path = session.getServletContext().getRealPath("/uploadBoard/");
		boardService.deleteBoard(boaNo, path);
		return "redirect:/board/notice";
	}
}
