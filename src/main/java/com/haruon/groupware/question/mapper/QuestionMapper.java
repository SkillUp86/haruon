package com.haruon.groupware.question.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.question.dto.AnswerDto;
import com.haruon.groupware.question.dto.QuestionDto;
import com.haruon.groupware.question.entity.FranchiseAskFile;

@Mapper
public interface QuestionMapper {

	// 답변 등록
	Integer insertAnswer(AnswerDto answerDto);
	
	// 문의 상태 변경
	Integer updateQuestionState(Integer questionNo);
	
	// 문의 상세
	QuestionDto getQuestion(Integer fraAskNo); // 문의
	List<FranchiseAskFile> getQuestionFiles(Integer fraAskNo); // 문의 파일
	AnswerDto getAnswer(Integer fraAskNo); // 답변
	
	// 문의 리스트
	List<QuestionDto> getQuestionList();
}
