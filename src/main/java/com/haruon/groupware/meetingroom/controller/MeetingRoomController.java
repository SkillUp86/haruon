package com.haruon.groupware.meetingroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.service.MeetingRoomService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MeetingRoomController {

	@Autowired MeetingRoomService meetingRoomService;
	
	@GetMapping("/meetingroom")
	public String meetingroom(Model model ) {
		List<MeetingRoom> meetingroomList = meetingRoomService.meetingroomList();	
		model.addAttribute("meetingroomList" ,meetingroomList);
		return"meetingroom/meetingroom";
	}
	
	@PostMapping("/addMeetingroom")
	public String addMeetingroom(
	        MeetingRoom meetingRoom, 
	        @RequestParam("meetingroomFile") MultipartFile file, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    try {
	        String path = request.getServletContext().getRealPath("/upload/meetingroom/");
	        
	        // 서비스 호출 (회의실 저장 -> 파일 저장)
	        meetingRoomService.addMeetingroom(meetingRoom, file, path);
	        
	        redirectAttributes.addFlashAttribute("message", "회의실이 성공적으로 추가되었습니다.");
	        return "redirect:/meetingroom";
	    } catch (Exception e) {
	        log.error("회의실 추가 중 오류 발생", e);
	        redirectAttributes.addFlashAttribute("error", "회의실 추가 중 오류가 발생했습니다.");
	        return "redirect:/addMeetingroom";
	    }
	}
	
	@GetMapping("/addMeetingroom")
	public String addMeetingroom() {
	    return "meetingroom/addMeetingroom";
	}
	
	@GetMapping("/deleteMeetingroom")
	public String deleteMeetingroom(@RequestParam("meeNO")Integer meeNo) {
		meetingRoomService.deleteMeetingroom(meeNo);
		return"meetingroom/meetingroom";
	}

	
}
