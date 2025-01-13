package com.haruon.groupware.board.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

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
}
