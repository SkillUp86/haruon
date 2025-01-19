package com.haruon.groupware.draft.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.draft.dto.response.ResponseAccessDraft;
import com.haruon.groupware.draft.dto.response.ResponseBasicDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseBusinessDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseDraft;
import com.haruon.groupware.draft.dto.response.ResponseSalesDraftDetail;
import com.haruon.groupware.draft.dto.response.ResponseVacationDraftDetail;
import com.haruon.groupware.draft.mapper.DraftMapper;

@Service
@Transactional
public class DraftService {

	private final DraftMapper draftMapper;

	public DraftService(DraftMapper draftMapper) {
		this.draftMapper = draftMapper;
	}

	// 유효성 검증
	public Boolean isAccess(int draNo) {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		int empNo = (int)details.getEmpNo();
		int depNo = (int)details.getDepNo();
		ResponseAccessDraft access = draftMapper.isAccess(draNo);
	
		// 해당 기안자 팀 부서장 모든 결재 접근 가능
		if(authorities.stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_HEAD") && (access.getDepNo() == depNo))) {
			return true;
		}
		// 결재라인, 참조자 접근가능
		if(access.getMidApp() == empNo || access.getFinalApp() == empNo || access.getRefNo() == empNo) {
			return true;
		}
		return false;
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
	public List<DraftFileEntity> getDraftFiles(int draNo) {
		return draftMapper.findDraftByFile(draNo);
	}

	// 기안문서 리스트
	public List<ResponseDraft> getDraftByPage(int empNo) {
		return draftMapper.findDraftByEmp(empNo);

	}
	// 결재 문서 리스트
	public List<ResponseDraft> getDraftByApproval(int empNo) {
		return draftMapper.findDraftByApproval(empNo);
	}

	public List<Map<String, Object>> getReferencesByEmp(int empNo) {
		return draftMapper.findDraftByReferences(empNo);
	}

		
		
}
