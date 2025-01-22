package com.haruon.groupware.schedule.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.service.ScheduleService;

@RestController
public class scheduleRestController {

	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("/schedule/calendarList")
	public List<Schedules> getCalendarList() {
		return scheduleService.schedulesList();
	}
}
