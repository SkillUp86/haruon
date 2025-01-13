package com.haruon.groupware.course.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CourseDto { // 교육 등록, 교육 수정
	private Integer eduNo;
	private Integer empNo;
	private String ename;
	private String title;
	private String content;
	private String place;
	private String eduDate;
	private Integer capacity;
	private String createDate;
	private String updateDate;
	private String cancleYn;
	private List<MultipartFile> educationFile;
}
