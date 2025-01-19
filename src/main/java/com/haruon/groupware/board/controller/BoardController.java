package com.haruon.groupware.board.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.haruon.groupware.auth.CustomUserDetails;
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
	public String board(Model model) {
		List<Map<String,Object>> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		
		List<Category> categoryList = categoryService.getCategoryListFree();
		model.addAttribute("categoryList", categoryList);
	
		return "board/board";
	}
	
	// 자유 게시판 리스트
	@GetMapping("/board/list")
	@ResponseBody
	public List<Map<String,Object>> boardList() {
		return boardService.getBoardList();
	}
	
	// 게시글 상세
	@GetMapping("/board/{boaNo}")
    public String getBoardOne(Authentication authentication, HttpSession session, @PathVariable Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
        // 댓글 리스트
        List<Map<String,Object>> commentList = boardService.getCommentList(boaNo);
        model.addAttribute("commentList",commentList);
	        // 댓글 입력 칸
	        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
			int empNo = userDetails.getEmpNo();
			model.addAttribute("empNo",empNo);
			String ename = userDetails.getEname();
			model.addAttribute("ename",ename);
        
        // 댓글 수
        Integer countCommnet = boardService.countComment(boaNo);
        model.addAttribute("countCommnet",countCommnet);
        
        // 추천 수
        Integer countLike = boardService.countLike(boaNo);
        model.addAttribute("countLike",countLike);
        
        // 첨부파일 리스트
        List<BoardFile> boardFiles = boardService.getBoardFiles(boaNo);
		model.addAttribute("boardFiles", boardFiles);
		
		// 조회수
		Integer updatedViewCnt = boardService.getViewCnt(boaNo); // 최신 조회수 가져오기
	    model.addAttribute("updatedViewCnt", updatedViewCnt);
		
        return "board/boardOne";
    }
	
	// 댓글 입력
	@PostMapping("/board/comment")
	public String insertComment(Authentication authentication, @RequestParam Integer boaNo, @RequestParam String content) {
		BoardComment boardComment = new BoardComment();
	    boardComment.setBoaNo(boaNo);
	    boardComment.setContent(content);
	    
	    CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
	    boardComment.setEmpNo(empNo); 
	    
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
    public String insertBoard(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
		model.addAttribute("empNo",empNo);
		String ename = userDetails.getEname();
		model.addAttribute("ename",ename);
		
        List<Category> categoryList = categoryService.getCategoryListFree();
        model.addAttribute("categoryList", categoryList);
        
        return "board/insert";
    }
	@PostMapping("/board/insert")
	public String insertBoard(Authentication authentication, HttpSession session, BoardDto boardDto) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
		boardDto.setEmpNo(empNo);
		
		String path = session.getServletContext().getRealPath("/upload/board/");
		boardService.insertBoard(boardDto, path);
		
		return "redirect:/board";
	}
	
	// 글 수정
	@GetMapping("/board/modify")
    public String modifyBoard(@RequestParam Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
        List<Category> categoryList = categoryService.getCategoryListFree();
		model.addAttribute("categoryList", categoryList);
		
		List<BoardFile> boardFiles = boardService.getBoardFiles(boaNo);
		model.addAttribute("boardFiles", boardFiles);
        
        return "board/modify";
    }
	@PostMapping("/board/modify")
	public String modifyBoard(@RequestParam Integer boaNo , @RequestParam Integer catNo, @RequestParam String title
							, @RequestParam String content, BoardDto boardDto, HttpSession session) {
		boardDto.setBoaNo(boaNo);
	    boardDto.setCatNo(catNo);
	    boardDto.setTitle(title);
	    boardDto.setContent(content);

	    String path = session.getServletContext().getRealPath("/upload/board/");
	    boardService.updateBoard(boardDto, path);

	    return "redirect:/board/" + boaNo;
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
	public String insertNotice(Authentication authentication, HttpSession session, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
		model.addAttribute("empNo",empNo);
		String ename = userDetails.getEname();
		model.addAttribute("ename",ename);
		
		return "board/insertNotice";
	}
	@PostMapping("/board/insertNotice")
	public String insertNotice(Authentication authentication, HttpSession session, BoardDto boardDto) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		int empNo = userDetails.getEmpNo();
		boardDto.setEmpNo(empNo);
		
		String path = session.getServletContext().getRealPath("/upload/board/");
		boardService.insertNotice(boardDto, path);
		
		return "redirect:/board/notice";
	}	
	
	// 공지 수정
	@GetMapping("/board/modifyNotice")
    public String modifyNotice(@RequestParam Integer boaNo, Model model) {
        Map<String, Object> board = boardService.getBoardOne(boaNo);
        model.addAttribute("b", board);
        
		List<BoardFile> boardFiles = boardService.getBoardFiles(boaNo);
		model.addAttribute("boardFiles", boardFiles);
        
        return "board/modifyNotice";
    }
	@PostMapping("/board/modifyNotice")
	public String modifyNotice(@RequestParam Integer boaNo , @RequestParam String title
							, @RequestParam String content, BoardDto boardDto, HttpSession session) {
		boardDto.setBoaNo(boaNo);
	    boardDto.setTitle(title);
	    boardDto.setContent(content);

	    String path = session.getServletContext().getRealPath("/upload/board/");
	    boardService.updateNotice(boardDto, path);

		return "redirect:/board/"+boaNo;
	}
	
	// 글 삭제
	@GetMapping("/board/delete")
	public String deleteBoard(HttpSession session, @RequestParam Integer boaNo) {
		String path = session.getServletContext().getRealPath("/upload/board/");
		boardService.deleteBoard(boaNo, path);
		return "redirect:/board";
	}
	// 공지 삭제
	@GetMapping("/board/deleteNotice")
	public String deleteNotice(HttpSession session, @RequestParam Integer boaNo) {
		String path = session.getServletContext().getRealPath("/upload/board/");
		boardService.deleteBoard(boaNo, path);
		return "redirect:/board/notice";
	}
}
