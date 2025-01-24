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
import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.entity.MsgFile;
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
	
	// 메일 발송
	@PostMapping("/insertMsg")
	public String insertMsg(HttpSession session, MsgDto msgDto) {
		log.debug("msgDto ======>" + msgDto);
		log.debug("StateS ======> " + msgDto.getStateS());
		// 파일업로드
		msgDto.getMsgFiles();
		
		// 파일 저장위치
		String path = session.getServletContext().getRealPath("/upload/msg/");
		log.debug("path =====> " + path);
		
		msgService.insertMsg(msgDto, path);
		
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
		
		List<MsgSenderDto> temporaryMsg = msgService.getTemporaryMsgList(empNo);
		model.addAttribute("temporaryMsg", temporaryMsg);
		
		// 메일 보내기 - 직원 목록
		List<EmpDto> empList = empService.getEmpList();
		model.addAttribute("empList", empList);
		return "msg/temporarysMsg";
	}
	
	// 받은 쪽지 휴지통
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
}
