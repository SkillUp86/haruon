package com.haruon.groupware.board.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.board.service.BoardService;

import jakarta.servlet.http.HttpSession;

@RestController
public class BoardRestController {
	@Autowired BoardService boardService;
	
	// 카테고리 별 리스트
	@GetMapping("/board/byCategory/{catNo}")
	public ResponseEntity<List<Map<String, Object>>> getBoardListByCatNo(@PathVariable Integer catNo) {
		List<Map<String, Object>> boardListByCatNo = boardService.getBoardListByCatNo(catNo);
		return ResponseEntity.ok(boardListByCatNo);
	}
	
	// 조회수 업데이트
	@PostMapping("/board/updateView/{boaNo}")
	public ResponseEntity<Map<String, Object>> updateViewCnt(@PathVariable Integer boaNo) {
	    boardService.updateViewCnt(boaNo);
	    Integer updatedViewCnt = boardService.getViewCnt(boaNo);
	    Map<String, Object> response = new HashMap<>();
	    response.put("viewCount", updatedViewCnt);
	    return ResponseEntity.ok(response);
	}
	
	// 추천 +
	@PostMapping("/board/like/{boaNo}")
    public ResponseEntity<Map<String, Object>> switchLike(@PathVariable Integer boaNo, Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        int empNo = userDetails.getEmpNo();

        boolean isLiked = boardService.switchLike(boaNo, empNo); // 추천 추가 or 취소
        
        Integer countLike = boardService.countLike(boaNo); // 추천 수 다시 가져오기

        Map<String, Object> response = new HashMap<>();
        response.put("status", isLiked ? "liked" : "unliked"); // 추천 상태 반환
        response.put("boaNo", boaNo);
        response.put("empNo", empNo);
        response.put("countLike", countLike);
        

        return ResponseEntity.ok(response);
    }
	
	// 글 수정 시 첨부파일 삭제
	@PostMapping("/board/deleteBoardFile")
    public String deleteFile(@RequestParam Integer boafNo) {
        String path = "/home/ubuntu/upload/board/";
        
        try {
            boardService.deleteBoardFileByOne(boafNo, path);
            return "success";
        } catch (Exception e) {
            return "fail";
        }
    }
}
