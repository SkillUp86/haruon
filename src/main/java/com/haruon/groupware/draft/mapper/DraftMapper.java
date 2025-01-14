package com.haruon.groupware.draft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.dto.response.ResponseBasicDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseBusinessDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseDraft;
import com.haruon.groupware.draft.dto.response.ResponseSalesDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseVacationDraftDetail;

@Mapper
public interface DraftMapper {
	// 유효성 검증
	int hasAccess(int draNo, int empNo);

	// 사원별 결재문서 리스트
	List<ResponseDraft> findDraftByApproval(int empNo);

	// 문서별 파일 리스트
	List<DraftFileEntity> findDraftByFile(int draNo);

	// 사원별 기안문서 리스트
	List<ResponseDraft> findDraftByEmp(int empNo);

	// 매출결재 상세문서
	ResponseVacationDraftDetail findByVacationDraftNo(int draNo);

	// 매출결재 상세문서
	ResponseSalesDraftDetail findBySalesDraftNo(int draNo);

	// 출장결재 상세문서
	ResponseBusinessDraftDetail findByBusinessDraftNo(int draNo);

	// 기본결재 상세문서
	ResponseBasicDraftDetail findByBasicDraftNo(int draNo);
}
