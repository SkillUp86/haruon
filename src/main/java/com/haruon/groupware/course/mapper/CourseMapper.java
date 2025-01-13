package com.haruon.groupware.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.course.dto.CourseDto;
import com.haruon.groupware.course.entity.EducationFile;
import com.haruon.groupware.user.entity.EmpEntity;


@Mapper
public interface CourseMapper {
	
	// 교육 삭제
	Integer deleteCourse(Integer eduNo);
	Integer deleteCourseFiles(Integer eduNo); // 파일 삭제
	
	// 교육 수정
	Integer modifyCourse(CourseDto courseDto);
	
	// 교육 수정 시 파일 삭제
	Integer deleteCourseFile(Integer edufNo);
	EducationFile selectCourseFile(Integer edufNo); // 파일 조회
	
	// 교육 상세
	CourseDto selectCourse(Integer eduNo);
	List<EducationFile> selectCourseFiles(Integer eduNo);
	
	// 교육 등록
	Integer insertCourse(CourseDto courseDto);
	
	// 교육 등록 시 담당자 리스트
	List<EmpEntity> selectEmpList(Integer deptNo);

	// 교육 등록 시 파일첨부
	Integer insertCourseFile(EducationFile educationFile);
	
	// 교육 리스트
	List<CourseDto> selectCourseList();
}
