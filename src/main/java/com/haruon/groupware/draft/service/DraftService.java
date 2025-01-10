package com.haruon.groupware.draft.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.dto.RequestDraftDetail;
import com.haruon.groupware.draft.dto.ResponseDraft;
import com.haruon.groupware.draft.dto.ResponseDraftDetail;
import com.haruon.groupware.draft.mapper.DraftMapper;

@Service
@Transactional
public class DraftService {
	
	private final DraftMapper draftMapper;
	
	public DraftService(DraftMapper draftMapper) {
		this.draftMapper = draftMapper;
	}

	// 결재 상세보기
	public ResponseDraftDetail getDraftDetail(int draNo, int empNo) {
		RequestDraftDetail draftDetail = new RequestDraftDetail();
		draftDetail.setDraNo(draNo);
		draftDetail.setEmpNo(empNo);
		return draftMapper.findByDraftNo(draftDetail);
	}
	
	// 결재 상세보기 파일리스트
	public List<DraftFileEntity> getDraftFiles(int draNo){
		return draftMapper.findDraftByFile(draNo);
	}
	
	// 결재 리스트
	public List<ResponseDraft> getDraftByPage(int empNo){
		return draftMapper.findDraftByEmp(empNo);
		
	}
}
