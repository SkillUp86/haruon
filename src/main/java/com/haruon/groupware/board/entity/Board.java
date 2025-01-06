package com.haruon.groupware.board.entity;

import lombok.Data;

@Data
public class Board {
	private Integer boaNo;
	private Integer empNo;
	private Integer catNo;
	private String title;
	private String content;
	private String createDate;
	private String updateDate;
	private String viewCnt;
}
