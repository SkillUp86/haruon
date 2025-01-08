package com.haruon.groupware.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.board.entity.Board;
import com.haruon.groupware.board.entity.BoardComment;
import com.haruon.groupware.board.entity.BoardFile;

@Mapper
public interface BoardMapper {
	/* 자유 */
	// /board
	List<Map<String,Object>> selectBoardList(Map<String,Object> map);
	
	// /board/insert
	Integer insertBoard(Board board);
	Integer insertBoardFile(BoardFile boardFile);
	
	// /board/{boaNo}
	Map<String,Object> selectBoardOne(Integer boaNo);
	List<Map<String,Object>> selectCommentList(Integer boaNo);
	Integer countComment(Integer boaNo);
	Integer countLike(Integer boaNo);
	Integer insertComment(BoardComment boardComment);
	
	// /board/update
	Integer updateBoard(Map<String,Object> map);
	List<BoardFile> selectBoardFiles(Integer boaNo);
	
	/* 공지 */
	// /board/notice
	List<Map<String,Object>> selectNoticeList(Map<String,Object> map);
	
	// /board/notice/insert
	Integer insertNotice(Board board);
	
	// /board/updateNotice
	Integer updateNotice(Map<String,Object> map);
}
