package com.haruon.groupware.draft.entity;

import lombok.Data;

@Data
public class Draft {
	private Integer draNo;
	private Integer empNo;
	private String kind;
	private String title;
	private String content;
	private String createDate;
	private String updateDate;
}
