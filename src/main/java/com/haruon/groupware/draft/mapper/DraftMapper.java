package com.haruon.groupware.draft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.draft.dto.RequestDraftDetail;
import com.haruon.groupware.draft.dto.ResponseDraft;
import com.haruon.groupware.draft.dto.ResponseDraftDetail;

@Mapper
public interface DraftMapper {

	// 사원별 문서 리스트
	List<ResponseDraft> findDraftByEmp(int empNo);
	
	// 결재 상세문서
	ResponseDraftDetail findByDraftNo(RequestDraftDetail draftDetail);
}
