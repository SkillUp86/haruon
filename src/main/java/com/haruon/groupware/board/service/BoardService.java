package com.haruon.groupware.board.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.board.dto.BoardDto;
import com.haruon.groupware.board.entity.Board;
import com.haruon.groupware.board.entity.BoardComment;
import com.haruon.groupware.board.entity.BoardFile;
import com.haruon.groupware.board.entity.BoardLike;
import com.haruon.groupware.board.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	
/* 자유 */
	// 자유 게시판 리스트
	public List<Map<String,Object>> getBoardList(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> boardList = boardMapper.selectBoardList(paramMap);
		return boardList;
	}
	
	// 카테고리 별 리스트
	public List<Map<String,Object>> getBoardListByCatNo(Integer catNo){
		Map<String,Object> map = new HashMap<>();
		map.put("catNo", catNo);
		return boardMapper.selectBoardListByCatNo(map);
	}
	
	// 게시글 상세
	public Map<String,Object> getBoardOne(Integer boaNo){
		return boardMapper.selectBoardOne(boaNo);
	}
	// 댓글 리스트
	public List<Map<String,Object>> getCommentList(Integer boaNo){
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("boaNo", boaNo); 
		List<Map<String,Object>> commentList = boardMapper.selectCommentList(boaNo);
		return commentList;
	}
	// 댓글 수
	public Integer countComment(Integer boaNo) {
		return boardMapper.countComment(boaNo);
	}
	// 추천 수
	public Integer countLike(Integer boaNo) {
		return boardMapper.countLike(boaNo);
	}
	// 조회수 업데이트
	public Integer updateViewCnt(Integer boaNo) {
		return boardMapper.updateViewCnt(boaNo);
	}
	// 조회수만 조회
	public Integer getViewCnt(Integer boaNo) {
        Map<String, Object> board = boardMapper.selectBoardOne(boaNo);
        return (Integer) board.get("viewCnt");
    }
	// 글 추천
	public boolean switchLike(Integer boaNo, Integer empNo) {
		// 추천 여부 확인
		Map<String, Object> map = new HashMap<>();
		map.put("boaNo", boaNo);
		map.put("empNo", empNo);
	    int likeCount = boardMapper.checkLike(map);
	    if (likeCount > 0) {
	    	// 이미 추천 -> 추천 취소
	    	boardMapper.cancelLike(map);
	        return false;
	    } else {
	    	// 추천 X -> 추천 +
	    	BoardLike boardLike = new BoardLike();
	        boardLike.setBoaNo(boaNo);
	        boardLike.setEmpNo(empNo);
	        boardMapper.insertBoardLike(boardLike);
			return true;
	    }
	}
	// 추천 여부 확인만
	public boolean isLiked(Integer boaNo, Integer empNo) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("boaNo", boaNo);
	    map.put("empNo", empNo);

	    // 추천 여부 확인
	    int likeCount = boardMapper.checkLike(map);
	    return likeCount > 0;
	}
	
	// 댓글 입력
	public Integer insertComment(BoardComment boardComment) {
		return boardMapper.insertComment(boardComment);
	}
	// 댓글 삭제
	public void deleteComment(Integer comNo) {
		boardMapper.deleteComment(comNo);
	}
	
	// 파일 첨부
	public void insertBoardFiles(BoardDto boardDto, String path) {
	    List<MultipartFile> list = boardDto.getBoardFile();
	    Integer boaNo = boardDto.getBoaNo();

	    for (MultipartFile mf : list) {
	        if (mf != null && !mf.isEmpty()) {
	            BoardFile boardFile = new BoardFile();
	            boardFile.setBoaNo(boaNo);
	            boardFile.setKind(mf.getContentType());
	            boardFile.setSize((int) mf.getSize());

	            // 파일 이름, 확장자
	            String filename = UUID.randomUUID().toString().replace("-", "");
	            boardFile.setFileName(filename);
	            int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
	            String originalName = mf.getOriginalFilename().substring(0, dotIdx);
	            String ext = mf.getOriginalFilename().substring(dotIdx + 1);
	            boardFile.setOriginalName(originalName);
	            boardFile.setExt(ext);

	            // DB에 파일 정보 삽입
	            int row2 = boardMapper.insertBoardFile(boardFile);
	            log.debug("insertBoardFile row: " + row2);
	            if (row2 == 1) {
	                try {
	                    // 물리적 파일 저장
	                    mf.transferTo(new File(path + filename + "." + ext));
	                } catch (IllegalStateException | IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }
	}
	
	// 게시글 입력
	public void insertBoard(BoardDto boardDto, String path) {
		Board board = new Board();
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setCatNo(boardDto.getCatNo());
		board.setEmpNo(boardDto.getEmpNo());
		
		Integer row = boardMapper.insertBoard(board);
		Integer boaNo = board.getBoaNo();
		boardDto.setBoaNo(boaNo);
		// log.debug("insertBoard boaNo: "+boaNo);
		
		// 첨부파일이 있을때만
		if(row == 1 && boardDto.getBoardFile() != null && !boardDto.getBoardFile().isEmpty()) { 
			 insertBoardFiles(boardDto, path);
		}
	}
	
	// 글 수정
	public void updateBoard(BoardDto boardDto, String path) {
	    // 1. 게시글 내용 업데이트
	    Map<String, Object> map = new HashMap<>();
	    map.put("boaNo", boardDto.getBoaNo());
	    map.put("catNo", boardDto.getCatNo());
	    map.put("title", boardDto.getTitle());
	    map.put("content", boardDto.getContent());

	    int row = boardMapper.updateBoard(map);

	    // 2. 새 파일 첨부
	    if (row == 1 && boardDto.getBoardFile() != null && !boardDto.getBoardFile().isEmpty()) {
	        insertBoardFiles(boardDto, path);
	    }
	}
	public List<BoardFile> getBoardFiles(Integer boaNo){
		return boardMapper.selectBoardFiles(boaNo);
	}
	
	// 첨부파일 하나씩 삭제
	public void deleteBoardFileByOne(Integer boafNo, String path) {
		// 삭제할 파일 정보
		BoardFile boardFile = boardMapper.selectBoardFileByBoafNo(boafNo);
		
		 if (boardFile != null) {
			int row = boardMapper.deleteBoardFileByOne(boafNo);

			// 물리적 파일 삭제
			if (row == 1) {
				String filePath = path + boardFile.getFileName() + "." + boardFile.getExt();
	            File file = new File(filePath);
		        if (file.exists()) {
		            file.delete();
		        }
			}
	    }
	}
	
/* 공지 */
	// 공지 리스트
	public List<Map<String,Object>> getNoticeList(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> noticeList = boardMapper.selectNoticeList(paramMap);
		return noticeList;
	}
	
	// 공지 입력
	public void insertNotice(BoardDto boardDto, String path) {
		Board board = new Board();
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setEmpNo(boardDto.getEmpNo());
		
		Integer row = boardMapper.insertNotice(board);
		Integer boaNo = board.getBoaNo();
		boardDto.setBoaNo(boaNo);
		
		// 첨부파일이 있을때만
		if(row == 1 && boardDto.getBoardFile() != null && !boardDto.getBoardFile().isEmpty()) { 
			 insertBoardFiles(boardDto, path);
		}
	}
	
	// 공지 수정
	public void updateNotice(BoardDto boardDto, String path) {
		// 1. 게시글 내용 업데이트
	    Map<String, Object> map = new HashMap<>();
	    map.put("boaNo", boardDto.getBoaNo());
	    map.put("title", boardDto.getTitle());
	    map.put("content", boardDto.getContent());

	    int row = boardMapper.updateNotice(map);

	    // 2. 새 파일 첨부
	    if (row == 1 && boardDto.getBoardFile() != null && !boardDto.getBoardFile().isEmpty()) {
	        insertBoardFiles(boardDto, path);
	    }
	}
	
	// 글 삭제
	public void deleteBoard(Integer boaNo, String path) {
		// 추천 삭제
		boardMapper.deleteLike(boaNo);
		// 댓글 삭제
		boardMapper.deleteCommentByBoaNo(boaNo);
		// 첨부파일 삭제
		List<BoardFile> list = boardMapper.selectBoardFiles(boaNo);
		boardMapper.deleteBoardFile(boaNo);
		// 글 삭제
		int row = boardMapper.deleteBoard(boaNo);
		// 물리적 파일 삭제
		if(row == 1 && list != null && list.size() >0) { // 글 삭제는 성공하고 물리적 파일이 존재한다면
			for(BoardFile bf : list) {
				String fileName = path + bf.getFileName() + "." + bf.getExt();
				File f = new File(fileName);
				f.delete();
			}
		}
	}
	
/* 홈 */
	public List<Map<String,Object>> getBoardHome(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> boardList = boardMapper.selectBoardHome(paramMap);
		return boardList;
	}
	public List<Map<String,Object>> getNoticeHome(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> boardList = boardMapper.selectNoticeHome(paramMap);
		return boardList;
	}
	
}
