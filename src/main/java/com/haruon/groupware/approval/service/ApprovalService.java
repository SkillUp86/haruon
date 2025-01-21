package com.haruon.groupware.approval.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;
import com.haruon.groupware.util.ApprovalFileUpload;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ApprovalService {

	private final ApprovalMapper approvalMapper;
	private final CommonMapper commonMapper;

	public ApprovalService(ApprovalMapper approvalMapper, CommonMapper commonMapper) {
		this.approvalMapper = approvalMapper;
		this.commonMapper = commonMapper;
	}

	// 기안서 유형 추가
	public void addApproval(RequestApproval approval, String path) {
		// 기본 기안서
		int basicRow = approvalMapper.saveBasicDraftByUser(approval);
		Integer draNo = approval.getDraNo();
		// 기안서 분기
		if (approval.getKind().equals("C02")) {
			approvalMapper.saveBusinessTripByUser(approval); // 출장 보고서
			approvalMapper.saveApprovalByUser(approval);
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		} else if (approval.getKind().equals("C03")) {
			approvalMapper.saveSalesByUser(approval); // 매출 보고서
			approvalMapper.saveApprovalByUser(approval);
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		} else if (approval.getKind().equals("C04")) {
			approvalMapper.saveVacationByUser(approval); // 휴가 보고서
			approvalMapper.saveApprovalByUser(approval);
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		} else {
			approvalMapper.saveApprovalByUser(approval);
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		}
		// 참조자 있을시 참조자 입력
		if (approval.getRefNo() != null) {
			approvalMapper.saveApprovalReference(approval);
		}

	}

	// 결재 첨부파일 존재시 추가
	private void existApprovalFile(RequestApproval approval, String path, int basicRow, Integer draNo) {
		log.debug("getFormFile {}",approval.getFormFile().isEmpty());
		if(basicRow == 1) {
			List<MultipartFile> file = approval.getFormFile();
			ApprovalFileUpload.getApprovalFileupload(path, draNo, file, approvalMapper);
		}
	}

	// 결재 코드
	public List<CommonCode> findByParentCode(String parentCode) {
		return commonMapper.findByParentCode(parentCode);
	}

	// 결재라인 해당 부서 직원
	public List<ResponseEmployee> findEmpByDept(int deptNo, int empNo) {
		return approvalMapper.findEmpByDept(deptNo, empNo);
	}

	// 결재 가맹점 선택 리스트
	public List<ResponseFranchise> findByFranchise() {
		return approvalMapper.findByFranchise();
	}

}
