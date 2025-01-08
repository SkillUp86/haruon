package com.haruon.groupware.approval.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;

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
	public void saveDraftAndApproval(RequestApproval approval, String path) {
		
		// 기본 기안서
		int basicRow = approvalMapper.saveBasicDraftByUser(approval);
		Integer draNo = approval.getDraNo();
		
		// 기안서 분기
		if(approval.getKind().equals("C02")) { 
			approvalMapper.saveApprovalByUser(approval); 
			approvalMapper.saveBusinessTripByUser(approval); // 출장 보고서
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		} else if(approval.getKind().equals("C03")) { 
			approvalMapper.saveApprovalByUser(approval); 
			approvalMapper.saveSalesByUser(approval); // 매출 보고서
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		} else if(approval.getKind().equals("C04")) { 
			approvalMapper.saveApprovalByUser(approval); 
			approvalMapper.saveVacationByUser(approval); // 휴가 보고서
			existApprovalFile(approval, path, basicRow, draNo); // 파일저장
		} 
		// 참조자 있을시 참조자 입력
		if(approval.getSubEmpNumber() != null) {
			approvalMapper.saveApprovalReference(approval);
		}
		
		// 첨부 파일 존재
		
	}

	
	
	// 결재 코드
	public List<CommonCode> findByParentCode(String parentCode) {
		return commonMapper.findByParentCode(parentCode);
	}
	
	// 결재라인 해당 부서 직원
	public List<ResponseEmployee> findEmpByDept(int deptNo){
		return approvalMapper.findEmpByDept(deptNo);
	}
	
	// 결재 가맹점 선택 리스트
	public List<ResponseFranchise> findByFranchise() {
		return approvalMapper.findByFranchise();
	}
	// 결재 첨부파일 존재시 추가
	private void existApprovalFile(RequestApproval approval, String path, int basicRow, Integer draNo) {
		if(basicRow == 1 && approval.getFormFile()!= null) {
			List<MultipartFile> file = approval.getFormFile();
			for(MultipartFile f : file) {
			DraftFileEntity draftFile = new DraftFileEntity();
			draftFile.setDraNo(draNo);
			draftFile.setKind(f.getContentType());
			draftFile.setSize(f.getSize());
			int dotInx = f.getOriginalFilename().lastIndexOf(".");
			String originName = f.getOriginalFilename().substring(0,dotInx);
			String fileName = UUID.randomUUID().toString().replace("-", "");
			String ext = f.getOriginalFilename().substring(dotInx+1);
			draftFile.setFileName(fileName);
			draftFile.setOriginName(originName);
			draftFile.setExt(ext);
			
			int draftFileRow = approvalMapper.saveDraftFileByUser(draftFile);
				if(draftFileRow == 1) {
					try {
						f.transferTo(new File(path + fileName +"."+ext));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
						throw new IllegalArgumentException("파일이 없습니다");
					}
				}
			}
		}
	}
}
