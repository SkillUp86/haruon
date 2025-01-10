package com.haruon.groupware.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ScheduleContoller {
	
	
	@GetMapping("/calendar")
    public String calendar() {
    	return "schedule/calendar";	
    }

}
