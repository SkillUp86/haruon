package com.haruon.groupware.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.board.entity.Board;
import com.haruon.groupware.board.entity.BoardFile;

@Mapper
public interface BoardMapper {
	// board
	List<Map<String,Object>> selectBoardList(Map<String,Object> map);
	
	// board/notice
	List<Map<String,Object>> selectNoticeList(Map<String,Object> map);
	
	// board/insert
	Integer insertBoard(Board board);
	Integer insertBoardFile(BoardFile boardFile);
	
	// board/{boaNo}
	Map<String,Object> selectBoardOne(Integer boaNo);
	List<Map<String,Object>> selectCommentList(Integer boaNo);
	Integer countComment(Integer boaNo);
	Integer countLike(Integer boaNo);
}
