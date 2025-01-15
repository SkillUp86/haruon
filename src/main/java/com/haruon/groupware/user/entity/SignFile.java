package com.haruon.groupware.user.entity;

import lombok.Data;

@Data
public class SignFile {
	private Integer signNo;
	private Integer empNo;
	private String fileName;
	private String ext; 
	private Long size;
	private String create_date;
	
}
