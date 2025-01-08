package com.haruon.groupware.board.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDto {
	private Integer boaNo;
	private Integer empNo;
	private Integer catNo;
	private String title;
	private String content;
	private String createDate;
	private String updateDate;
	private String viewCnt;
	private List<MultipartFile> BoardFile;
}
