package com.haruon.groupware.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.board.entity.Board;
import com.haruon.groupware.board.entity.BoardComment;
import com.haruon.groupware.board.entity.BoardFile;
import com.haruon.groupware.board.entity.BoardLike;


@Mapper
public interface BoardMapper {
/* 자유 */
	// 자유 게시판 리스트
	List<Map<String,Object>> selectBoardList(Map<String,Object> map);
	
	// 카테고리 별 리스트
	List<Map<String,Object>> selectBoardListByCatNo(Map<String,Object> map);
	
	// 게시글 입력
	Integer insertBoard(Board board);
	Integer insertBoardFile(BoardFile boardFile);
	
	// 게시글 상세
	Map<String,Object> selectBoardOne(Integer boaNo);
	List<Map<String,Object>> selectCommentList(Integer boaNo); // 댓글 리스트
	Integer countComment(Integer boaNo); // 댓글 수 
	
	Integer countLike(Integer boaNo); // 추천 수
	Integer checkLike(Map<String,Object> map); // 추천 여부 확인
	Integer cancelLike(Map<String,Object> map); // 추천 취소
	
	Integer updateViewCnt(Integer boaNo); // 조회수 업데이트
	Integer insertBoardLike(BoardLike boardLike); // 글 추천
	
	// 댓글 입력
	Integer insertComment(BoardComment boardComment);
	
	// 댓글 삭제
	Integer deleteComment(Integer comNo);
	
	// 글 수정
	Integer updateBoard(Map<String,Object> map);
	List<BoardFile> selectBoardFiles(Integer boaNo);
	
	// 글 수정 시 첨부파일 삭제(하나씩 삭제)
	BoardFile selectBoardFileByBoafNo(Integer boafNo);
	Integer deleteBoardFileByOne(Integer boafNo);
	
/* 공지 */
	// 공지 리스트
	List<Map<String,Object>> selectNoticeList(Map<String,Object> map);
	
	// 공지 입력
	Integer insertNotice(Board board);
	
	// 공지 수정
	Integer updateNotice(Map<String,Object> map);
	
	// (카테고리 삭제) board 테이블에서 특정 cat_no를 기타 카테고리로 업데이트
	Integer updateCatNo(Integer catNo, Integer newCatNo);
	
	// 글 삭제
	Integer deleteBoard(Integer boaNo);
	// 첨부파일 삭제
	Integer deleteBoardFile(Integer boaNo);
	// 글 삭제 전 댓글 삭제
	Integer deleteCommentByBoaNo(Integer boaNo);
	// 글 삭제 전 추천 삭제
	Integer deleteLike(Integer boaNo);
	
/* 홈 */ 
	List<Map<String,Object>> selectBoardHome(Map<String,Object> map);
	List<Map<String,Object>> selectNoticeHome(Map<String,Object> map);
}
