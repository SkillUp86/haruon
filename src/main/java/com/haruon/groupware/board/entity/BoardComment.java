package com.haruon.groupware.board.entity;

import lombok.Data;

@Data
public class BoardComment {
	private Integer commNo;
	private Integer boaNo;
	private Integer empNo;
	private String content;
	private String createDate;

}
