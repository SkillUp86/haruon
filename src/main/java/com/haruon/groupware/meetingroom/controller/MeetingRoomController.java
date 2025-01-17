package com.haruon.groupware.meetingroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.haruon.groupware.meetingroom.service.MeetingRoomService;

@Controller
public class MeetingRoomController {

	@Autowired MeetingRoomService meetingRoomService;	
	
	@GetMapping("/meetingroom")
	public String meetingroom(Model model) {
		meetingRoomService.meetingroomList();
		return"meetingroom/meetingroom";
	}
}
