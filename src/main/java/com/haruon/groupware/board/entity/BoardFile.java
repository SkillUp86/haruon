package com.haruon.groupware.board.entity;

import lombok.Data;

@Data
public class BoardFile {
	private Integer boafNo;
	private Integer boaNo;
	private String originalName;
	private String fileName;
	private String ext;
	private String kind;
	private Integer size;
	private String createDate;
}
