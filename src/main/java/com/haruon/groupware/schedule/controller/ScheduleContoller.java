package com.haruon.groupware.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class ScheduleContoller {
	
	@Autowired ScheduleService scheduleService;
	
	@GetMapping("/calendar")
    public String calendar(Model model) {
        String parentCode = "G00"; // 부모 코드 설정
        List<CommonCode> kindList = scheduleService.kind(parentCode); // 데이터 조회
        model.addAttribute("kindList", kindList); // 뷰에 데이터 전달
        return "schedule/calendar"; // 일정 페이지 반환
    }


	
	@PostMapping("/addSchedule")
	public String addSchedule(Schedules schedules, Model model) {
	    scheduleService.addSchedule(schedules);
	    model.addAttribute("msg", "일정이 추가되었습니다.");
	    return "redirect:/calendar"; 
	}
	

		
}
