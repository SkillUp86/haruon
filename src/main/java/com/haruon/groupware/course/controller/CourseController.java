package com.haruon.groupware.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseController {

	@GetMapping("/franchises/courses")
	public String courses() {
		return "course/courses";
	}
 
}
