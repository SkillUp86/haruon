package com.haruon.groupware.draft.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.draft.dto.request.RequestUpdateBasicDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateBusinessDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateSalesDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateVacationDraft;
import com.haruon.groupware.draft.mapper.UpdateMapper;
import com.haruon.groupware.util.ApprovalFileUpload;

@Transactional
@Service
public class UpdateService {

	private final UpdateMapper updateMapper;
	private final ApprovalMapper approvalMapper;
	

	public UpdateService(UpdateMapper updateMapper, ApprovalMapper approvalMapper) {
		this.updateMapper = updateMapper;
		this.approvalMapper = approvalMapper;
	}
	
	// 휴가 업데이트
	public void getUpdateVacationDraft(RequestUpdateVacationDraft vacationDraft, String path) {
		int row = updateMapper.updateVacationDraft(vacationDraft);
		int draNo = vacationDraft.getDraNo();
		List<MultipartFile> file = vacationDraft.getFormFile();
		ApprovalFileUpload.getApprovalFileupload(path, draNo, file, approvalMapper);
	}
	
	// 매출 업데이트
	public void getUpdateSalesDraft(RequestUpdateSalesDraft salesDraft, String path) {
		int row = updateMapper.updateSalesDraft(salesDraft);
		int draNo = salesDraft.getDraNo();
		List<MultipartFile> file = salesDraft.getFormFile();
		ApprovalFileUpload.getApprovalFileupload(path, draNo, file, approvalMapper);
	}
	// 출장 업데이트
	public void getUpdateBusinessDraft(RequestUpdateBusinessDraft businessDraft, String path) {
		int row = updateMapper.updateBusinessDraft(businessDraft);
		int draNo = businessDraft.getDraNo();
		List<MultipartFile> file = businessDraft.getFormFile();
		ApprovalFileUpload.getApprovalFileupload(path, draNo, file, approvalMapper);
	}
	// 기본 업데이트
	public void getUpdateBasicDraft(RequestUpdateBasicDraft basicDraft, String path) {
		int row = updateMapper.updateBasicDraft(basicDraft);
		int draNo = basicDraft.getDraNo();
		List<MultipartFile> file = basicDraft.getFormFile();
		ApprovalFileUpload.getApprovalFileupload(path, draNo, file, approvalMapper);
	}
	
}
