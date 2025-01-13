package com.haruon.groupware.draft.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.draft.dto.RequestUpdateBasicDraft;
import com.haruon.groupware.draft.mapper.UpdateMapper;
@Transactional
@Service
public class UpdateService {

	private final UpdateMapper updateMapper;
	private final ApprovalMapper approvalMapper;
	
	public UpdateService(UpdateMapper updateMapper, ApprovalMapper approvalMapper) {
		this.updateMapper = updateMapper;
		this.approvalMapper = approvalMapper;
	}
	
	public void getUpdateBasicDraft(RequestUpdateBasicDraft basicDraft,String path) {
		int row = updateMapper.updateBasicDraft(basicDraft);
		if(row==1 && basicDraft.getFormFile() != null && !basicDraft.getFormFile().isEmpty()) {
			List<MultipartFile> file = basicDraft.getFormFile();
			for(MultipartFile f : file) {
				DraftFileEntity draftFile = new DraftFileEntity();
				draftFile.setDraNo(basicDraft.getDraNo());
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
