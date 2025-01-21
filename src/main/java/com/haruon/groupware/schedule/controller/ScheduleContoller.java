package com.haruon.groupware.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ScheduleContoller {
	
	@Autowired ScheduleService scheduleService;
	
	@GetMapping("/calendar")
    public String calendar(Model model, Integer schNo ) {
       
        return "schedule/calendar"; // 일정 페이지 반환
    }

	
	
	@PostMapping("/addSchedule")
	public String addSchedule(Schedules schedules, Model model) {
	    boolean schedule = scheduleService.addSchedule(schedules);
	    if(!schedule) {
	    	return "login";
	    }
	    
	    model.addAttribute("msg", "일정이 추가되었습니다.");
	    return "redirect:/calendar"; 
	}

	

	@GetMapping("/deleteSchedule")
	public String deleteSchedule(@RequestParam("schNo") Integer schNo) {
	    scheduleService.deleteSchedule(schNo);
	    return "schedule/calendar";
	}

	@PostMapping("/updateSchedule")
	public String updateSchedule(Schedules schedules, Model model) {
	    Integer updatedRows = scheduleService.updateSchedule(schedules);
	    if (updatedRows > 0) {
	        model.addAttribute("msg", "업데이트 성공");
	    } else {
	        model.addAttribute("msg", "업데이트 실패");
	    }
	    return "redirect:/calendar";
	}
	
	@GetMapping("/calendarDetail/{schNo}")
	public String getMethodName(@PathVariable Integer schNo ,Model model) {
		Schedules schedule = scheduleService.scheduleOne(schNo);
		model.addAttribute("s",schedule);
		return "schedule/scheduleDetail";
	}
	
	

}
