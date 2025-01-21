package com.haruon.groupware.meetingroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.entity.MeetingRoomFile;
import com.haruon.groupware.meetingroom.service.MeetingRoomService;

@Controller
public class MeetingRoomController {

	@Autowired MeetingRoomService meetingRoomService;
	
	@GetMapping("/meetingroom")
	public String meetingroom(Model model ) {
		List<MeetingRoom> meetingroomList = meetingRoomService.meetingroomList();	
		model.addAttribute("meetingroomList" ,meetingroomList);
		return"meetingroom/meetingroom";
	}
	
	@GetMapping("/addMeetingroom")
	public String addMeetingroom() {
		return"meetingroom/addMeetingroom";
	}
	
	@PostMapping("/addMeetingroom")
	public String addMeetingroom(MeetingRoom meetingRoom, MeetingRoomFile meetingRoomFile) {
	    // 회의실 먼저 저장
	    meetingRoomService.addMeetingroom(meetingRoom);
	    
	    // 파일 정보 저장
	    meetingRoomService.addMeetingroomFile(meetingRoomFile);
	    
	    return "meetingroom/meetingroom";
	}
	
	@GetMapping("/deleteMeetingroom")
	public String deleteMeetingroom(@RequestParam("meeNO")Integer meeNo) {
		meetingRoomService.deleteMeetingroom(meeNo);
		return"meetingroom/meetingroom";
	}

	
}
