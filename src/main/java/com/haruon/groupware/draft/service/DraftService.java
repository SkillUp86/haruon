package com.haruon.groupware.draft.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.dto.ResponseDraft;
import com.haruon.groupware.draft.dto.ResponseSalesDraftDetail;
import com.haruon.groupware.draft.dto.ResponseVacationDraftDetail;
import com.haruon.groupware.draft.dto.ResponseBasicDraftDetail;
import com.haruon.groupware.draft.dto.ResponseBusinessDraftDetail;
import com.haruon.groupware.draft.mapper.DraftMapper;

@Service
@Transactional
public class DraftService {
	
	private final DraftMapper draftMapper;
	
	public DraftService(DraftMapper draftMapper) {
		this.draftMapper = draftMapper;
	}
	
	// 결재 문서 리스트
	public List<ResponseDraft> getDraftByApproval(int empNo) {
		return draftMapper.findDraftByApproval(empNo);
	}

	// 휴가 결재 상세보기
	public ResponseVacationDraftDetail getVacationDraftDetail(int draNo) {
		return draftMapper.findByVacationDraftNo(draNo);
	}
	// 매출 결재 상세보기
	public ResponseSalesDraftDetail getSalesDraftDetail(int draNo) {
		return draftMapper.findBySalesDraftNo(draNo);
	}
	// 출장 결재 상세보기
	public ResponseBusinessDraftDetail getBusinessDraftDetail(int draNo) {
		return draftMapper.findByBusinessDraftNo(draNo);
	}
	// 기본 결재 상세보기
	public ResponseBasicDraftDetail getBasicDraftDetail(int draNo) {
		return draftMapper.findByBasicDraftNo(draNo);
	}
	
	// 결재 상세보기 파일리스트
	public List<DraftFileEntity> getDraftFiles(int draNo){
		return draftMapper.findDraftByFile(draNo);
	}
	
	// 기안문서 리스트
	public List<ResponseDraft> getDraftByPage(int empNo){
		return draftMapper.findDraftByEmp(empNo);
		
	}
}
