package com.haruon.groupware.attendance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haruon.groupware.attendance.service.ManageAttendanceService;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.entity.EmpEntity;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AttendanceController {
	@Autowired private ManageAttendanceService editAttendanceService;
	// 개인 근태/연가/출장 관리 페이지
	@GetMapping("/employee/attendance")
	public String attendanceEmp(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("empNo", userDetails.getEmpNo());
		model.addAttribute("depNo", userDetails.getDepNo());
		return "attendance/attendanceEmp";
	}
	// 부서 근태/연가/출장 관리 페이지
	@GetMapping("/department/attendance")
	public String attendanceDivision(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("depNo", userDetails.getDepNo());
		return "attendance/attendanceDivision";
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
