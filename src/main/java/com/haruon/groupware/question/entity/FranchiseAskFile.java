package com.haruon.groupware.question.entity;

import lombok.Data;

@Data
public class FranchiseAskFile {
	private Integer fraAskfNo;
	private Integer fraAskNo;

	private String originalName;
	private String fileName;
	private String ext;
	private String kind;
	private Integer size;
	private String createDate;

}
