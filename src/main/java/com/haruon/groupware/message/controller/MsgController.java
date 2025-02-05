package com.haruon.groupware.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.message.dto.MsgDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.service.MsgService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.service.EmpService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MsgController {
	@Autowired MsgService msgService;
	@Autowired EmpService empService;

	
	// 메일 발송 (+ 임시저장)
	@PostMapping("/insertMsg")
	public String insertMsg(MsgDto msgDto) {
		log.debug("msgDto ======>" + msgDto);
		log.debug("StateS ======> " + msgDto.getStateS());
		// 파일업로드
		msgDto.getMsgFiles();
		
		// 파일 저장위치
		String path = "/home/ubuntu/upload/msg/";
		log.debug("path =====> " + path);
		
		msgService.insertMsg(msgDto, path);
		
		if("E01".equals(msgDto.getStateS())) {
			return "redirect:/temporarysMsg";
		} else {
			return "redirect:/sendersMsg";
		}
	}
	
	// 임시저장 발송
	@PostMapping("/modifyMsg/{msgNo}")
	public String modifyMsg(@PathVariable Integer msgNo, MsgDto msgDto) {
		log.debug("msgNo ======>" + msgNo);

		// 파일업로드
		msgDto.getMsgFiles();
		
		// 파일 저장위치
		String path = "/home/ubuntu/upload/msg/";
		log.debug("path =====> " + path);
		
		msgService.modifyMsg(msgDto, path, msgNo);
		
		return "redirect:/sendersMsg";
	}
	
	// 받은 쪽지함
	@GetMapping("/readersMsg")
	public String getReadersMsg(Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		String ename = userDetails.getEname();
		String email = userDetails.getUsername();
		model.addAttribute("empNo", empNo);
		model.addAttribute("ename", ename);
		model.addAttribute("email", email);
		
		// 메일 보내기 - 직원 목록
		List<EmpDto> empList = empService.getEmpList();
		model.addAttribute("empList", empList);
		return "msg/readersMsg";
	}
	
	// 보낸 쪽지함
	@GetMapping("/sendersMsg")
	public String getSendersMsg(Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		String ename = userDetails.getEname();
		String email = userDetails.getUsername();
		model.addAttribute("empNo", empNo);
		model.addAttribute("ename", ename);
		model.addAttribute("email", email);
		
		// 메일 보내기 - 직원 목록
		List<EmpDto> empList = empService.getEmpList();
		model.addAttribute("empList", empList);
		
		return "msg/sendersMsg";
	}
	
	// 임시 보관함
	@GetMapping("/temporarysMsg")
	public String getMsgTemporarys (Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		String ename = userDetails.getEname();
		String email = userDetails.getUsername();
		model.addAttribute("empNo", empNo);
		model.addAttribute("ename", ename);
		model.addAttribute("email", email);
		
		// 메일 보내기 - 직원 목록
		List<EmpDto> empList = empService.getEmpList();
		model.addAttribute("empList", empList);
		return "msg/temporarysMsg";
	}
	// 임시보관함 삭제
	@PostMapping("/deleteMsg/{msgNo}")
	public String deleteMsg(@PathVariable Integer msgNo) {
		msgService.deleteMsg(msgNo);
		return "msg/temporarysMsg";
	}
	
	// 휴지통
	@GetMapping("/trashsMsg")
	public String getMsgTrashs (Authentication authentication, Model model) {
		// 로그인정보
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Integer empNo = userDetails.getEmpNo();
		String ename = userDetails.getEname();
		String email = userDetails.getUsername();
		model.addAttribute("empNo", empNo);
		model.addAttribute("ename", ename);
		model.addAttribute("email", email);
		
		// 메일 보내기 - 직원 목록
		List<EmpDto> empList = empService.getEmpList();
		model.addAttribute("empList", empList);
		return "msg/trashsMsg";
	}
	
	// 휴지통 이동
	@PostMapping("/trashMsg/{msgNo}")
	public String insertTrashMsg(@PathVariable Integer msgNo) {
		log.debug("msgsNo =========> " + msgNo);
		msgService.insertTrashMsg(msgNo);
		return "redirect:/trashsMsg";
	}
	
	// 휴지통 -> 받은쪽지 복원
	@PostMapping("/backMsg/{msgNo}")
	public String backMsg(@PathVariable Integer msgNo) {
		msgService.backMsg(msgNo);
		return "redirect:/readersMsg";
	}
	
	// 영구 삭제
	@PostMapping("/deleteMsgR/{msgNo}")
	public String deleteMsgR(@PathVariable Integer msgNo) {
		msgService.deleteMsgR(msgNo);
		return "redirect:/trashsMsg";
	}
	@PostMapping("/deleteMsgS/{msgNo}")
	public String deleteMsgS(@PathVariable Integer msgNo) {
		msgService.deleteMsgS(msgNo);
		return "redirect:/sendersMsg";
	}
	
}
