package com.haruon.groupware.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.board.mapper.BoardMapper;

@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	
	// /board
	public List<Map<String,Object>> getBoardList(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> boardList = boardMapper.selectBoardList(paramMap);
		
		return boardList;
	}
}
