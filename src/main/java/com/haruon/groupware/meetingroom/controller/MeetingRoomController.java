package com.haruon.groupware.meetingroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
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
	
	@GetMapping("/deleteMeetingroom/{meeNo}")
    public String deleteMeetingroom(@PathVariable Integer meeNo, RedirectAttributes redirectAttributes) {
        try {
            // 삭제 작업을 로그로 확인
            log.debug("삭제할 meeNo: " + meeNo);

            Integer result = meetingRoomService.deleteMeetingroom(meeNo);
            
            if (result == 1) {
                redirectAttributes.addFlashAttribute("message", "회의실과 예약이 성공적으로 삭제되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "회의실 또는 예약 삭제에 실패했습니다.");
            }
        } catch (Exception e) {
            log.error("삭제 중 오류 발생", e);
            redirectAttributes.addFlashAttribute("error", "오류가 발생했습니다: " + e.getMessage());
        }
        
        return "redirect:/meetingroom";  // 삭제 후 회의실 목록 페이지로 리다이렉트
    }
	
	 @GetMapping("/modifyMeetingroom/{meeNo}")
	    public String modifyMeetingroom(@PathVariable Integer meeNo, Model model) {
	        MeetingRoomDto meetingRoom = meetingRoomService.meetingroomOne(meeNo);
	        model.addAttribute("meetingRoom", meetingRoom);
	        return "meetingroom/modifyMeetingroom";  // 수정 화면으로 이동
	    }

	    // 회의실 수정 처리
	 @PostMapping("/updateMeetingroom")
	 public String updateMeetingroom(
	         @ModelAttribute MeetingRoom meetingRoom,
	         @RequestParam(value = "meetingroomFile", required = false) MultipartFile meetingroomFile,HttpServletRequest request, RedirectAttributes redirectAttributes) {
	     try {
	         // 저장 경로 전달
	         String path = request.getServletContext().getRealPath("/upload/meetingroom/");
	         
	         // 서비스 호출
	         meetingRoomService.updateMeetingroom(meetingRoom, meetingroomFile, path);

	         redirectAttributes.addFlashAttribute("message", "회의실이 성공적으로 수정되었습니다.");
	         return "redirect:/meetingroom";
	     } catch (Exception e) {
	         log.error("회의실 수정 중 오류 발생", e);
	         redirectAttributes.addFlashAttribute("error", "회의실 수정 중 오류가 발생했습니다.");
	         return "redirect:/meetingroom/modifyMeetingroom/" + meetingRoom.getMeeNo();
	     }
	 }
	}
	
	

