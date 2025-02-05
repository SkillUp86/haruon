package com.haruon.groupware.course.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.course.dto.CourseDto;
import com.haruon.groupware.course.entity.EducationFile;
import com.haruon.groupware.course.service.CourseService;
import com.haruon.groupware.user.entity.EmpEntity;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CourseController {
	@Autowired CourseService courseService;
	
	// 교육 삭제
	@GetMapping("/franchises/courses/delete")
	public String deleteCourse(@RequestParam Integer eduNo) {
		String path = "/home/ubuntu/upload/course/";
		courseService.deleteCourse(eduNo, path);
		return "redirect:/franchises/courses";
	}
	
	// 교육 수정
	@GetMapping("/franchises/courses/modify")
	public String modifyCourse(@RequestParam Integer eduNo, Model model) {
		// 저장된 교육 정보 불러오기
		CourseDto course = courseService.getCourse(eduNo);
		List<EducationFile> courseFileList = courseService.getCourseFiles(eduNo);
		
		// 담당자 이름 불러오기 => 나중에 수정 예정 #######################################
		Integer deptNo = 2; 
		List<EmpEntity> empList = courseService.getEmpList(deptNo);
		
		model.addAttribute("c", course);
		model.addAttribute("cfl", courseFileList);
		model.addAttribute("empList", empList);
		return "course/modify";
	}
	@PostMapping("/franchises/courses/modify")
	public String modifyCourse(CourseDto courseDto) {
		// 파일업로드
		courseDto.getEducationFile();
		
		// 파일 저장위치
		String path = "/home/ubuntu/upload/course/";
		log.debug("path =====> " + path);
		log.debug("eduNo =====> " + courseDto.getEduNo());
		
		courseService.modifyCourse(courseDto, path);
		
		return "redirect:/franchises/courses/" + courseDto.getEduNo();
	}
	
	// 교육 수정 시 첨부파일 삭제
	@GetMapping("/franchises/courses/deleteFile")
	public String deleteFile(@RequestParam Integer eduNo, @RequestParam Integer edufNo) {
		String path = "/home/ubuntu/upload/course/";
		courseService.deleteCourseFile(edufNo, path);
		return "redirect:/franchises/courses/modify?eduNo=" + eduNo;
	}
	
	// 교육 상세
	@GetMapping("/franchises/courses/{eduNo}")
	public String course(@PathVariable Integer eduNo, Model model) {
		CourseDto course = courseService.getCourse(eduNo);
		List<EducationFile> courseFileList = courseService.getCourseFiles(eduNo);
		model.addAttribute("c", course);
		model.addAttribute("cfl", courseFileList);
		return "course/course";
	}
	
	// 교육 등록
	@GetMapping("/franchises/courses/insert")
	public String insertCourse(Model model) {
		// 담당자 리스트 불러오기 =? 나중에 수정 예정 #######################################
		Integer deptNo = 2; 
		List<EmpEntity> empList = courseService.getEmpList(deptNo);
		
		model.addAttribute("empList", empList);
		return "course/insert";
	}
	
	@PostMapping("/franchises/courses/insert")
	public String insertCourse(CourseDto courseDto) {
		log.debug("EduNo =====> " + courseDto.getEduNo());
		
		// 파일업로드
		courseDto.getEducationFile();
		
		// 파일 저장위치
		String path = "/home/ubuntu/upload/course/";
		log.debug("path =====> " + path);
		
		courseService.insertCourse(courseDto, path);
		
		return "redirect:/franchises/courses";
	}
	
	// 교육 조회
	@GetMapping("/franchises/courses")
	public String courses(Model model) {
		List<CourseDto> courseList = courseService.getCourseList();
		model.addAttribute("courseList", courseList);
		return "course/courses";
	}
 
}
