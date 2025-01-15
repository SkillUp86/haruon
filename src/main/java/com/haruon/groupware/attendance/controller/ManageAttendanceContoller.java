package com.haruon.groupware.attendance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.attendance.service.AttendanceService;
import com.haruon.groupware.attendance.service.ManageAttendanceService;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.entity.EmpEntity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManageAttendanceContoller {
	@Autowired private ManageAttendanceService editAttendanceService;
	
	// 출퇴근 등록
	@GetMapping("/employee/registerAttendance")
	public String registerAttendance(Authentication authentication, RedirectAttributes ra) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		String result = editAttendanceService.registerAttendance(userDetails.getEmpNo());
		
		String registerAttendanceResult = switch(result) {
			case "시작시간등록-출장시간" -> "현재시간보다 더 이른 출장일정이 있어, 해당 시간으로 등록합니다.";
			case "시작시작등록-정상등록" -> "출근시간 등록이 정상적으로 처리되었습니다.";
			case "퇴근시간등록-정상등록" -> "퇴근시간 등록이 정상적으로 처리되었습니다.";
			case "연차-미등록" -> "금일 연차 일정이 있어, 출근등록을 정상적으로 처리하지 못하였습니다.";
			default -> null;
		};
		
		ra.addFlashAttribute("registerAttendanceResult", registerAttendanceResult);
		  
		log.debug(result);
		log.debug(registerAttendanceResult);
		return "redirect:/home";
	}
	
	// (부서장) 근태 승인 (approvalYN 변경)
	@PostMapping("/attendance/modify/approvalYN")
	public String updateAttendanceApproval(Authentication authentication, RedirectAttributes ra
											, @RequestParam List<String> modifyTarget) {
		log.debug("selectBox post parameter, modifyTarget = " + modifyTarget.toString());
		Integer updateFailCnt = editAttendanceService.modifyApprovalYN(modifyTarget);
		String modifyResultMsg = "근태 승인이 정상적으로 처리되었습니다.";
		String updateRestult = "success";
		if(updateFailCnt > 0) {
			modifyResultMsg =  "상태가 [미지정]인, " + updateFailCnt + "건 업데이트가 실패하였습니다.";
			updateRestult = "fail";
		}
		ra.addFlashAttribute("updateResultCode", updateRestult);
		ra.addFlashAttribute("modifyResultMsg", modifyResultMsg);
		
		return "redirect:/department/attendance";
	}
	
	// (부서장) 근태변경 (state 변경)
	@GetMapping("/attendance/modify/state")
	public String updateAttendanceState(Authentication authentication, RedirectAttributes ra
										, @RequestParam String state, @RequestParam String modifyTarget) {
		Integer updateCnt = editAttendanceService.modifyState(modifyTarget, state);
		
		String modifyResultMsg = "근태 상태 변경이 정상적으로 처리되었습니다.";
		String updateRestult = "success";
		if(updateCnt != 1) {
			modifyResultMsg =  "근태 상태 업데이트에 실패하였습니다.";
			updateRestult = "fail";
		}
		ra.addFlashAttribute("updateResultCode", updateRestult);
		ra.addFlashAttribute("modifyResultMsg", modifyResultMsg);
		
		return "redirect:/department/attendance";
	}
	
	// (부서장) 연차변경 (emp - totalLeave)변경
	@PostMapping("/employee/modify/totalLeave")
	public String updateEmployeeTotalLeave(Authentication authentication, RedirectAttributes ra, EmpEntity emp) {
		log.debug("updateEmployeeTotalLeave - 파라미터 상태 : " + emp.toString());
		Integer updateCnt = editAttendanceService.updateTotalLeaveByDivision(emp);
		String modifyResultMsg = "연차 조정이 정상적으로 처리되었습니다.";
		String updateRestult = "success";
		
		if(updateCnt != 1) {
			modifyResultMsg =  "연차 조정이 실패하였습니다.";
			updateRestult = "fail";
		}
		
		ra.addFlashAttribute("updateResultCode", updateRestult);
		ra.addFlashAttribute("modifyResultMsg", modifyResultMsg);
		
		return "redirect:/department/attendance";
	}
	
}
