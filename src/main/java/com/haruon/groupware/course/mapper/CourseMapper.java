package com.haruon.groupware.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.course.dto.CourseDto;
import com.haruon.groupware.course.entity.Education;
import com.haruon.groupware.course.entity.EducationFile;


@Mapper
public interface CourseMapper {
	
	// 교육 등록
	Integer insertCourse(Education edu);

	// 교육 등록 시 파일첨부
	Integer insertCourseFile(EducationFile educationFile);
	
	// 교육 리스트
	List<CourseDto> selectCourseList();
}
