package com.haruon.groupware.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.haruon.groupware.question.dto.AnswerDto;
import com.haruon.groupware.question.dto.QuestionDto;
import com.haruon.groupware.question.entity.FranchiseAskAnswer;
import com.haruon.groupware.question.entity.FranchiseAskFile;
import com.haruon.groupware.question.service.QuestionService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	
	// 답변 등록
	@PostMapping("/franchises/questions/{fraAskNo}")
	public String insertAnswer(@PathVariable Integer fraAskNo, HttpSession session) {
		Integer empNo = (Integer)session.getAttribute("empNo");
		
		questionService.insertAnswer();
		return "redirect:/franchises/questions/" + fraAskNo;
	}
	
	// 문의 + 답변 상세
	@GetMapping("/franchises/questions/{fraAskNo}")
	public String getQuestion(@PathVariable Integer fraAskNo, Model model) {
		QuestionDto question = questionService.getQuestion(fraAskNo);
		List<FranchiseAskFile> questionFileList = questionService.getQuestionFiles(fraAskNo);
		AnswerDto answer = questionService.getAnswer(fraAskNo);
		
		model.addAttribute("q", question);
		model.addAttribute("qfl", questionFileList);
		model.addAttribute("a", answer);
		return "question/question";
	}
	
	// 문의 리스트
	@GetMapping("/franchises/questions")
	public String getQuestionList(Model model) {
		List<QuestionDto> questionList = questionService.getQuestionDto();
		
		model.addAttribute("ql", questionList);
		return "question/questions";
	}
	
}
