package com.haruon.groupware.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.question.dto.AnswerDto;
import com.haruon.groupware.question.dto.QuestionDto;
import com.haruon.groupware.question.entity.FranchiseAskFile;
import com.haruon.groupware.question.mapper.QuestionMapper;

@Service
@Transactional
public class QuestionService {
	@Autowired QuestionMapper questionMapper;
	
	// 답변 등록
	public Integer insertAnswer(AnswerDto answerDto) {
		
		int result = questionMapper.updateQuestionState(answerDto.getFraAskNo());
		
		try {
			if(result != 1) {
				throw new RuntimeException("문의상태 변경 오류, 관리자에게 문의하세요.");
			}
		} catch(Exception e) {
			e.getStackTrace();
		}
		return questionMapper.insertAnswer(answerDto);
	}
	
	// 문의 상세
	public QuestionDto getQuestion(Integer fraAskNo) {
		return questionMapper.getQuestion(fraAskNo);
	}
	// 문의 상세 첨부파일
	public List<FranchiseAskFile> getQuestionFiles(Integer fraAskNo) {
		return questionMapper.getQuestionFiles(fraAskNo);
	}
	// 답변 조회
	public AnswerDto getAnswer(Integer fraAskNo) {
		return questionMapper.getAnswer(fraAskNo);
	}
	
	// 문의 리스트
	public List<QuestionDto> getQuestionDto() {
		return questionMapper.getQuestionList();
	}
}
