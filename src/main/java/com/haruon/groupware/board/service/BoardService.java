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
	// /board
	public List<Map<String,Object>> getBoardList(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> boardList = boardMapper.selectBoardList(paramMap);
		return boardList;
	}
	
	// /board/{boaNo}
	public Map<String,Object> getBoardOne(Integer boaNo){
		return boardMapper.selectBoardOne(boaNo);
	}
	public List<Map<String,Object>> getCommentList(Integer boaNo){
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("boaNo", boaNo); 
		List<Map<String,Object>> commentList = boardMapper.selectCommentList(boaNo);
		return commentList;
	}
	public Integer countComment(Integer boaNo) {
		return boardMapper.countComment(boaNo);
	}
	public Integer countLike(Integer boaNo) {
		return boardMapper.countLike(boaNo);
	}
	public Integer insertComment(BoardComment boardComment) {
		return boardMapper.insertComment(boardComment);
	}
	
	// /board/insert
	public void insertBoard(BoardDto boardDto, String path) {
		Board board = new Board();
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setCatNo(boardDto.getCatNo());
		
		Integer boaNo = board.getBoaNo();
		boardDto.setBoaNo(boaNo);
		
		Integer row = boardMapper.insertBoard(board);
		
		if(row == 1 && boardDto.getBoardFile() != null) {
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
	
	// /board/update
	public Integer updateBoard(Map<String,Object> map) {
		return boardMapper.updateBoard(map);
	}
	public List<BoardFile> getBoardFiles(Integer boaNo){
		return boardMapper.selectBoardFiles(boaNo);
	}
	
	/* 공지 */
	// /board/notice
	public List<Map<String,Object>> getNoticeList(){
		Map<String,Object> paramMap = new HashMap<>();
		List<Map<String,Object>> noticeList = boardMapper.selectNoticeList(paramMap);
		return noticeList;
	}
	
	// /board/notice/insert
	public void insertNotice(BoardDto boardDto, String path) {
		Board board = new Board();
		board.setTitle(boardDto.getTitle());
		board.setContent(boardDto.getContent());
		board.setCatNo(boardDto.getCatNo());
		
		Integer boaNo = board.getBoaNo();
		boardDto.setBoaNo(boaNo);
		
		Integer row = boardMapper.insertNotice(board);
		
		if(row == 1 && boardDto.getBoardFile() != null) {
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
	
	// /board/updateNotice
	public Integer updateNotice(Map<String,Object> map) {
		return boardMapper.updateNotice(map);
	}
}
