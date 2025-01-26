package com.haruon.groupware.meetingroom.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
import com.haruon.groupware.meetingroom.service.MeetingRoomService;
import com.haruon.groupware.meetingroom.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Controller
public class ReservationController {
	
	@Autowired ReservationService reservationService;
	@Autowired MeetingRoomService meetingRoomService;
	@Autowired DeptService deptService;

	@GetMapping("/myReservation")
	public String myReservation() {
		return"meetingroom/myReservation";
	}
	
	//회의실 예약 리스트
	@GetMapping("/addReservation/{meeNo}")
	public String addReservation(
	    @PathVariable int meeNo, 
	    @RequestParam(required = false) String revDate, 
	    @RequestParam(required = false) String revTime, 
	    Model model
	) {
	    // 회의실 정보 가져오기
	    MeetingRoomDto meetingRoom = meetingRoomService.meetingroomOne(meeNo);

	    // 부서 목록 가져오기
	    List<Dept> deptList = deptService.findByAll();

	    // 예약 가능 시간 가져오기
	    List<String> reservationTime = new ArrayList<>();
	    
	    // revDate가 존재할 때만 예약 시간 가져오기
	    if (revDate != null && !revDate.isEmpty()) {
	        reservationTime = reservationService.ReservationTime(meeNo, revDate);
	    }

	    
	    model.addAttribute("meetingRoom", meetingRoom);
	    model.addAttribute("deptList", deptList);
	    model.addAttribute("reservationTime", reservationTime);

	    return "meetingroom/addReservation";
	}

}
