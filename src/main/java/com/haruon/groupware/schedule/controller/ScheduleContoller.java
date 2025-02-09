package com.haruon.groupware.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
       
        return "schedule/calendar"; 
    }

	@PostMapping("/addSchedule")
	public String addSchedule(@ModelAttribute Schedules schedule, RedirectAttributes redirectAttributes) {
	    // 서비스 호출
	    int result = scheduleService.addSchedule(schedule);

	    // 성공 여부 확인
	    if (result > 0) {
	        redirectAttributes.addFlashAttribute("message", "일정이 성공적으로 추가되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("error", "일정 추가 중 오류가 발생했습니다.");
	    }

	    return "redirect:/calendar"; 
	}
	
	@GetMapping("/deleteSchedule/{schNo}")
	public String deleteSchedule(@PathVariable("schNo") Integer schNo) {
	    scheduleService.deleteSchedule(schNo);
	    return "redirect:/calendar"; 
	    
	}

	@PostMapping("/updateSchedule")
	public String updateSchedule(@ModelAttribute Schedules schedules, String parentCode, Model model) {
		List<CommonCode> kind = scheduleService.kind(parentCode);
		
		model.addAttribute("kind", kind);
		
	    log.debug("Received schedules for update: {}", schedules);

	    if (schedules == null || schedules.getSchNo() == null) {
	        return "redirect:/calendar";
	    }
	    int updatedRows = scheduleService.updateSchedule(schedules);

	    if (updatedRows > 0) {
	    }

	    return "redirect:/calendar";
	}

	
	@GetMapping("/calendarDetail/{schNo}")
	public String getMethodName(@PathVariable Integer schNo ,Model model , @RequestParam String kind) {
		Schedules schedule = null;
		if(kind.equals("G04")) {
			schedule = scheduleService.scheduleOneByReservation(schNo);
		}else {
			schedule =scheduleService.scheduleOne(schNo);
		}
		model.addAttribute("s",schedule);
		return "schedule/scheduleDetail";
	}
	
	
}
