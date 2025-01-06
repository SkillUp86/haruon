package com.haruon.groupware.draft.entity;

import lombok.Data;

@Data
public class DraftFile {
	private Integer drafNo;
	private Integer draNo;
	private String originName;
	private String fileName;
	private String ext;
	private String kind;
	private String size;
	private String createDate;
}
