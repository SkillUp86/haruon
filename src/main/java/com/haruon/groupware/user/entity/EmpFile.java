package com.haruon.groupware.user.entity;

import lombok.Data;

@Data
public class EmpFile {
	private Integer empfNo;
	private Integer empNo;
	private String originalName;
	private String fileName;
	private String ext;
	private String kind;
	private String size;
	private String createDate;
}
