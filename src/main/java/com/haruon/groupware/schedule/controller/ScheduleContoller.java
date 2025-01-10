package com.haruon.groupware.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ScheduleContoller {
	
	@Autowired ScheduleService scheduleService;
	
	@GetMapping("/calendar")
    public String calendar() {
    	return "schedule/calendar";	
    }

}
