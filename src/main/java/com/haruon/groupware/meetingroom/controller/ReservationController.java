package com.haruon.groupware.meetingroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;
import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
import com.haruon.groupware.meetingroom.service.MeetingRoomService;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Controller
public class ReservationController {
	
	@Autowired MeetingRoomService meetingRoomService;
	@Autowired DeptService deptService;

	@GetMapping("/myReservation")
	public String myReservation() {
		return"meetingroom/myReservation";
	}
	//회의실 예약 리스트
	@GetMapping("/addReservation/{meeNo}")
	public String addReservation(@PathVariable int meeNo, Model model) {
	    MeetingRoomDto meetingRoom = meetingRoomService.meetingroomOne(meeNo);
	    List<Dept> deptList = deptService.findByAll();
	    model.addAttribute("meetingRoom", meetingRoom);
	    model.addAttribute("deptList" ,deptList);

	    return "meetingroom/addReservation"; 
	}
}
