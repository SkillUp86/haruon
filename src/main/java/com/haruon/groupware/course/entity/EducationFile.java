package com.haruon.groupware.course.entity;

import lombok.Data;

@Data
public class EducationFile {
	private Integer edufNo;
	private Integer eduNo;
	private String originName;
	private String fileName;
	private String ext;
	private String kind;
	private Long size;
	private String createDate;
	
}
