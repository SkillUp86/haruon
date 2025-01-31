package com.haruon.groupware.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseApprovalCount;
import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.entity.DraftFileEntity;


@Mapper
public interface ApprovalMapper {
	// 참조자 
	int saveApprovalReference(RequestApproval approval);
	// 결재 첨부파일
	int saveDraftFileByUser(DraftFileEntity draftFile);
	// 결재라인
	int saveApprovalByUser(RequestApproval approval);
	// 휴가 보고서
	int saveVacationByUser(RequestApproval approval);
	// 매출 보고서
	int saveSalesByUser(RequestApproval approval);
	// 출장 보고서
	int saveBusinessTripByUser(RequestApproval approval);
	// 기본 기안서
	int saveBasicDraftByUser(RequestApproval approval);
	// 부서별 직원 리스트
	List<ResponseEmployee> findEmpByDept(int deptNo, int empNo);
	// 가맹점 결재 리스트
	List<ResponseFranchise> findByFranchise();
	
	List<ResponseEmployee> findEmpDept(int deptNo, int empNo);

	// 메인페이지에 보여줄 5개
	ResponseApprovalCount findApprovalByMainPage(int empNo);
}
