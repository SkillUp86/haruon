package com.haruon.groupware.board.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.board.service.BoardService;

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
        // 조회수 증가
        boardService.updateViewCnt(boaNo);

        // 업데이트된 조회수 가져오기
        Integer updatedViewCnt = boardService.getViewCnt(boaNo);

        Map<String, Object> response = new HashMap<>();
        response.put("viewCnt", updatedViewCnt);

        return ResponseEntity.ok(response);
    }
	
	// 추천 +
	@PostMapping("/board/like/{boaNo}")
    public ResponseEntity<Map<String, Object>> insertLike(@PathVariable Integer boaNo, Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        int empNo = userDetails.getEmpNo();

        boardService.insertBoardLike(boaNo, empNo); // 추천 +
        
        Integer countLike = boardService.countLike(boaNo); // 추천 수 다시 가져오기

        // 추천 성공 후, 상태를 반환
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("boaNo", boaNo);
        response.put("empNo", empNo);
        response.put("countLike", countLike);
        

        return ResponseEntity.ok(response);
    }
}
