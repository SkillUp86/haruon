package com.haruon.groupware.course.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CourseDto { // 교육 추가
	private Integer eduNo;
	private Integer empNo;
	private String title;
	private String content;
	private String place;
	private String eduDate;
	private String capacity;
	private String createDate;
	private String updateDate;
	private String cancleYn;
	private List<MultipartFile> educationFile;
}
