package com.haruon.groupware.meetingroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
import com.haruon.groupware.meetingroom.service.MeetingRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReservationController {
	
	@Autowired MeetingRoomService meetingRoomService;

	@GetMapping("/myReservation")
	public String myReservation() {
		return"meetingroom/myReservation";
	}
	
	@GetMapping("/addReservation/{meeNo}")
	public String addReservation(@PathVariable int meeNo, Model model) {
		
	    MeetingRoomDto meetingRoom = meetingRoomService.meetingroomOne(meeNo);

	    model.addAttribute("meetingRoom", meetingRoom);

	    return "meetingroom/addReservation"; 
	}
}
