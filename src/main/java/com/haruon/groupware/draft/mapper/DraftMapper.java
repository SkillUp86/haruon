package com.haruon.groupware.draft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.dto.ResponseDraft;
import com.haruon.groupware.draft.dto.ResponseDraftDetail;

@Mapper
public interface DraftMapper {
	// 사원별 결재문서 리스트
	List<ResponseDraft> findDraftByApproval(int empNo);
	
	// 문서별 파일 리스트
	List<DraftFileEntity> findDraftByFile(int draNo);

	// 사원별 기안문서 리스트
	List<ResponseDraft> findDraftByEmp(int empNo);
	
	// 결재 상세문서
	ResponseDraftDetail findByDraftNo(int draNo);
}
