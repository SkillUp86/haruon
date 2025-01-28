package com.haruon.groupware.meetingroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
import com.haruon.groupware.meetingroom.dto.MyReservationDto;
import com.haruon.groupware.meetingroom.service.MeetingRoomService;
import com.haruon.groupware.meetingroom.service.ReservationService;
import com.haruon.groupware.schedule.dto.ScheduleDto;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Controller
public class ReservationController {
	
	@Autowired ReservationService reservationService;
	@Autowired MeetingRoomService meetingRoomService;
	@Autowired DeptService deptService;

	@GetMapping("/myReservation")
	public String myReservation(Model model ) {
		List<MyReservationDto> myReservationList = reservationService.MyReservationList();
		model.addAttribute("myReservationList",myReservationList);
		return"meetingroom/myReservation";
	}
	
	//회의실 예약 리스트
	@GetMapping("/addReservation/{meeNo}")
	public String addReservation(@PathVariable int meeNo, @RequestParam(required = false) String revDate, @RequestParam(required = false) String revTime, Model model) {
	    // 회의실 정보 가져오기
	    MeetingRoomDto meetingRoom = meetingRoomService.meetingroomOne(meeNo);

	    // 부서 목록 가져오기
	    List<Dept> deptList = deptService.findByAll();

	    // 예약 가능 시간 가져오기
	    List<CommonCode> reservationTime = reservationService.ReservationTime(meeNo, revDate);

	    // Model에 필요한 데이터 추가
	    model.addAttribute("meetingRoom", meetingRoom);
	    model.addAttribute("deptList", deptList);
	    model.addAttribute("reservationTime", reservationTime);

	    return "meetingroom/addReservation";
	}
	
	@PostMapping("addReservation/{meeNo}")
	public String addReservation(@PathVariable int meeNo, @RequestParam String content,@RequestParam String revDate,@RequestParam String revTime,@RequestParam String revTimeDescript,@RequestParam String attendees , Model model) {
	    
	    ScheduleDto scheduleDto = new ScheduleDto();
	    scheduleDto.setMeeNo(meeNo);
	    scheduleDto.setContent(content);
	    scheduleDto.setRevDate(revDate);
	    scheduleDto.setRevTime(revTime); 
	    scheduleDto.setRevTimeDescript(revTimeDescript); 
	    
	    reservationService.addReservationAndSchedule(scheduleDto, attendees, model);
	    return "redirect:/meetingroom";
	}
	
	@GetMapping("/deleteReservation/{resNo}")
	public String deleteReservation(@PathVariable("resNo") Integer resNo) {
	    reservationService.deleteReservation(resNo);
	    return"meetingroom/myReservation";
	    
	}
}
