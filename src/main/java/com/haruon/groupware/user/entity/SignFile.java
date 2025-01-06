package com.haruon.groupware.user.entity;

import lombok.Data;

@Data
public class SignFile {
	private Integer signNo;
	private Integer empNo;
	private String originalName;
	private String fileName;
	private String ext;
	private String kind;
	private Integer size;
	private String create_date;
	
}
