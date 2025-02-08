package com.haruon.groupware.approval.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseApprovalCount;
import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;
import com.haruon.groupware.exception.InvalidApprovalException;
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
		// 유형별 유효성 검증
		validateByKind(approval);
		// 기본 기안서
		int basicRow = approvalMapper.saveBasicDraftByUser(approval);
		Integer draNo = approval.getDraNo();
		// 기안서 분기
		switch (approval.getKind()) {
		case "C02":
			approvalMapper.saveBusinessTripByUser(approval); // 출장 보고서
			break;
		case "C03":
			approvalMapper.saveSalesByUser(approval); // 매출 보고서
			break;
		case "C04":
			approvalMapper.saveVacationByUser(approval); // 휴가 보고서
			break;
		default:
			break;
		}
		approvalMapper.saveApprovalByUser(approval);
		existApprovalFile(approval, path, basicRow, draNo); // 파일 저장
		// 참조자 있을시 참조자 입력
		if (approval.getRefNo() != null) {
			approvalMapper.saveApprovalReference(approval);
		}

	}

	// 유형별 유효성 검증 로직
	private void validateByKind(RequestApproval approval) {
		switch (approval.getKind()) {
		case "C02": // 출장 보고서
			if (approval.getPlace() == null || approval.getPlace().isBlank()) {
				throw new InvalidApprovalException("출장 지역은 필수입니다.");
			}
			if (approval.getPlaceStartDate() == null || approval.getPlaceEndDate() == null) {
				throw new InvalidApprovalException("출장 기간은 필수입니다.");
			}
			break;

		case "C03": // 매출 보고서
			if (approval.getYm() == null || approval.getYm().isBlank()) {
				throw new InvalidApprovalException("연월은 필수입니다.");
			}
			if (approval.getRevenue() == null || approval.getRevenue() <= 0) {
				throw new InvalidApprovalException("매출액은 필수이며 0보다 커야 합니다.");
			}
			break;

		case "C04": // 휴가 보고서
			if (approval.getVacStartDate() == null || approval.getVacFinishDate() == null) {
				throw new InvalidApprovalException("휴가 기간은 필수입니다.");
			}
			if (approval.getVacationType() == null || approval.getVacationType().isBlank()) {
				throw new InvalidApprovalException("휴가 유형은 필수입니다.");
			}
			break;
		default:
			break;
		}
	}

	// 결재 첨부파일 존재시 추가
	private void existApprovalFile(RequestApproval approval, String path, int basicRow, Integer draNo) {
		log.debug("getFormFile {}", approval.getFormFile().isEmpty());
		if (basicRow == 1) {
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
	// 메인 페이지
	public ResponseApprovalCount getApprovalByMainPage(int empNo) {
		return approvalMapper.findApprovalByMainPage(empNo);
	}
}
