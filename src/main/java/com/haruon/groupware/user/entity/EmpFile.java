package com.haruon.groupware.user.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class EmpFile implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer empfNo;
	private Integer empNo;
	private String originalName;
	private String fileName;
	private String ext;
	private String kind;
	private Long size;
	private String createDate;
}
