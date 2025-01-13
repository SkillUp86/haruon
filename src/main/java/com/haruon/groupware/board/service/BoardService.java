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
	
	// 댓글 입력
	public Integer insertComment(BoardComment boardComment) {
		return boardMapper.insertComment(boardComment);
	}
	// 댓글 삭제
	public void deleteComment(Integer comNo) {
		boardMapper.deleteComment(comNo);
	}
	
	// 게시글 입력
	public void insertBoard(BoardDto boardDto, String path) {
		Board board = new Board();
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setCatNo(boardDto.getCatNo());
		board.setEmpNo(boardDto.getEmpNo());
		
		Integer boaNo = board.getBoaNo();
		boardDto.setBoaNo(boaNo);
		
		Integer row = boardMapper.insertBoard(board);
		
		if(row == 1 && boardDto.getBoardFile() != null && !boardDto.getBoardFile().isEmpty()) { // 첨부파일이 있을때만
			List<MultipartFile> list = boardDto.getBoardFile();
			for(MultipartFile mf : list) {
				if (mf != null && !mf.isEmpty()) { // 파일이 있을 떄
					BoardFile boardFile = new BoardFile();
					boardFile.setBoaNo(boaNo);
					boardFile.setKind(mf.getContentType());
					boardFile.setSize(Integer.parseInt(String.valueOf(mf.getSize())));
					
					// 파일 이름, 확장자
					String filename = UUID.randomUUID().toString().replace("-", "");
					boardFile.setFileName(filename);
					int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
					String originName = mf.getOriginalFilename().substring(0,dotIdx);
					String ext = mf.getOriginalFilename().substring(dotIdx+1);
					boardFile.setOriginalName(originName);
					boardFile.setExt(ext);
					
					// BoardFile을 db에 삽입
					int row2 = boardMapper.insertBoardFile(boardFile);
					log.debug("insertBoardFile row: "+Integer.toString(row2));
					if(row2 == 1) {
						try { // 물리적 파일 저장
							mf.transferTo(new File(path + filename + "." + ext));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	// 글 수정
	public Integer updateBoard(Map<String,Object> map) {
		return boardMapper.updateBoard(map);
	}
	public List<BoardFile> getBoardFiles(Integer boaNo){
		return boardMapper.selectBoardFiles(boaNo);
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
		board.setCatNo(boardDto.getCatNo());
		
		Integer row = boardMapper.insertNotice(board);
		
		if(row == 1 && boardDto.getBoardFile() != null) {
			Integer boaNo = board.getBoaNo();
			boardDto.setBoaNo(boaNo);
			
			List<MultipartFile> list = boardDto.getBoardFile();
			for(MultipartFile mf : list) {
				BoardFile boardFile = new BoardFile();
				boardFile.setBoaNo(boaNo);
				boardFile.setKind(mf.getContentType());
				boardFile.setSize(Integer.parseInt(String.valueOf(mf.getSize())));
				
				// 파일 이름, 확장자
				String filename = UUID.randomUUID().toString().replace("-", "");
				boardFile.setFileName(filename);
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String originName = mf.getOriginalFilename().substring(0,dotIdx);
				String ext = mf.getOriginalFilename().substring(dotIdx+1);
				boardFile.setOriginalName(originName);
				boardFile.setExt(ext);
				
				// BoardFile을 db에 삽입
				int row2 = boardMapper.insertBoardFile(boardFile);
				log.debug("insertBoardFile row: "+Integer.toString(row2));
				if(row2 == 1) {
					try { // 물리적 파일 저장
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	// 공지 수정
	public Integer updateNotice(Map<String,Object> map) {
		return boardMapper.updateNotice(map);
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
}
