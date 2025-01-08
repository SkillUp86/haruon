package com.haruon.groupware.approval.entity;

import lombok.Data;

@Data
public class DraftFileEntity {
	private Integer drafNo;
	private Integer draNo;
	private String originName;
	private String fileName;
	private String ext;
	private String kind;
	private Long size;
	private String createDate;
}
