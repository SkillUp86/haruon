package com.haruon.groupware.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.board.entity.Board;

@Mapper
public interface BoardMapper {
	List<Map<String,Object>> selectBoardList(Map<String,Object> map);
	
	Integer insertBoard(Board board);
}
