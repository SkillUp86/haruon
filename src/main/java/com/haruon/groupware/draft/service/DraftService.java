package com.haruon.groupware.draft.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.draft.dto.ResponseDraft;
import com.haruon.groupware.draft.mapper.DraftMapper;

@Service
@Transactional
public class DraftService {
	
	private final DraftMapper draftMapper;
	
	public DraftService(DraftMapper draftMapper) {
		this.draftMapper = draftMapper;
	}

	public List<ResponseDraft> getDraftByPage(int empNo){
		return draftMapper.findDraftByEmp(empNo);
		
	}
}
