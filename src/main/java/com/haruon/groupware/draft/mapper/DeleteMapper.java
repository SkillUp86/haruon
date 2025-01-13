package com.haruon.groupware.draft.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.entity.DraftFileEntity;

@Mapper
public interface DeleteMapper {
	
	// 첨부파일 개별 삭제
	int removeDraftFile(int drafNo);
	// 첨부파일 하나 검색
	DraftFileEntity findDraftFileByDrafNo(int drafNo);
	// 매출문서 삭제
	int removeSalesDraftByDraNo(int draNo);
	// 출장문서 삭제
	int removeBusinessDraftByDraNo(int drafNo);
	// 휴가문서 삭제
	int removeVacationDraftByDraNo(int draNo);
	// 기본기안서 삭제
	int removeBasicDraftByDraNo(int drafNo);
	// 기안문서 삭제시 첨부파일 전부 삭제
	int removeDraftFileByDraNo(int draNo);
	// 결재문서 삭제
	int removeApprovalByAppNo(int drafNo);
	// 참조자 있을시 삭제
	int removeReferencesByAppNo(int draNo);
	
	
}
