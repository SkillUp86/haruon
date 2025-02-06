package com.haruon.groupware.meetingroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.auth.CustomUserDetails;
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
	public String meetingroom(Model model) {
		List<MeetingRoom> meetingroomList = meetingRoomService.meetingroomList();	
		model.addAttribute("meetingroomList" ,meetingroomList);
		return"meetingroom/meetingroom";
	}
	
	@PostMapping("/addMeetingroom")
	public String addMeetingroom(
	        MeetingRoom meetingRoom, 
	        @RequestParam("meetingroomFile") MultipartFile file, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    try {
	        String path = "/home/ubuntu/upload/meetingroom/";
	        
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
	public String deleteMeetingroom(@PathVariable Integer meeNo, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    try {
	        // 저장 경로 확인
	        String path = "/home/ubuntu/upload/meetingroom/";

	        // 삭제 작업 실행
	        log.debug("삭제할 meeNo: " + meeNo);

	        Integer result = meetingRoomService.deleteMeetingroom(meeNo, path);

	        if (result == 1) {
	            redirectAttributes.addFlashAttribute("m	essage", "회의실과 파일이 성공적으로 삭제되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "회의실 또는 파일 삭제에 실패했습니다.");
	        }
	    } catch (Exception e) {
	        log.error("삭제 중 오류 발생", e);
	        redirectAttributes.addFlashAttribute("error", "오류가 발생했습니다: " + e.getMessage());
	    }

	    return "redirect:/meetingroom"; // 삭제 후 회의실 목록 페이지로 리다이렉트
	}

	
	 @GetMapping("/modifyMeetingroom/{meeNo}")
	    public String modifyMeetingroom(@PathVariable Integer meeNo, Model model) {
	        MeetingRoomDto meetingRoom = meetingRoomService.meetingroomOne(meeNo);
	        model.addAttribute("meetingRoom", meetingRoom);
	        CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int deptNo = details.getDepNo();
	        if (deptNo == 4 ) {
				return "meetingroom/modifyMeetingroom";
	        }
	        return "redirect:/meetingroom"; 
	    }

	    // 회의실 수정 처리
	 @PostMapping("/updateMeetingroom")
	 public String updateMeetingroom(
	         @ModelAttribute MeetingRoom meetingRoom,
	         @RequestParam(value = "meetingroomFile", required = false) MultipartFile meetingroomFile,
	         HttpServletRequest request,
	         RedirectAttributes redirectAttributes) {
	     try {
	         // 저장 경로 전달
	         String path = "/home/ubuntu/upload/meetingroom/";

	         // 회의실 정보 업데이트
	         meetingRoomService.updateMeetingroom(meetingRoom);

	         // 파일 업로드 처리 (파일이 있을 때만)
	         if (meetingroomFile != null && !meetingroomFile.isEmpty()) {
	             meetingRoomService.profileUpload(meetingroomFile, meetingRoom.getMeeNo(), path);
	         }

	         redirectAttributes.addFlashAttribute("message", "회의실이 성공적으로 수정되었습니다.");
	         return "redirect:/meetingroom";
	     } catch (Exception e) {
	         log.error("회의실 수정 중 오류 발생", e);
	         redirectAttributes.addFlashAttribute("error", "회의실 수정 중 오류가 발생했습니다.");
	         return "redirect:/meetingroom/updateMeetingroom/" + meetingRoom.getMeeNo();
	     }
	 }

}
	
	

