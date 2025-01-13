package com.haruon.groupware.course.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.course.service.CourseService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class CourseRestController {
	@Autowired CourseService courseService;

//	// 교육 수정 시 첨부파일 삭제
//	@GetMapping("/franchises/courses/deleteFile")
//	public String deleteFile(HttpSession session
//							, @RequestParam Integer eduNo) {
//		String path = session.getServletContext().getRealPath("/uploadCourse/");
//		courseService.deleteCourseFile(eduNo);
//		return "";
//	}
}
