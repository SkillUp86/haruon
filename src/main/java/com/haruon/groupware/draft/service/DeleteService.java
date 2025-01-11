package com.haruon.groupware.draft.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.mapper.DeleteMapper;
import com.haruon.groupware.draft.mapper.DraftMapper;

@Service
@Transactional
public class DeleteService {

	private final DeleteMapper deleteMapper;
	private final DraftMapper draftMapper;
	
	
	public DeleteService(DeleteMapper deleteMapper, DraftMapper draftMapper) {
		this.deleteMapper = deleteMapper;
		this.draftMapper = draftMapper;
	}
	
	public void getDeleteBasicDraft(int draNo, int appNo, String path) {
		// 삭제 순서 1.참조자 삭제 2.결재 삭제  3.파일전체 삭제  4.물리적 파일 삭제  5. 문서 삭제
		deleteMapper.removeReferencesByAppNo(appNo);
		deleteMapper.removeApprovalByAppNo(appNo);
		
		List<DraftFileEntity> fileList = draftMapper.findDraftByFile(draNo);
		int removeDraftRow = deleteMapper.removeDraftFileByDraNo(draNo);
		if(removeDraftRow == 1 && fileList.size() > 0) {
			for (DraftFileEntity f : fileList) {
				String filename = path + f.getFileName()+"."+f.getExt();
				File file = new File(filename);
				file.delete();
			}
		}
		
		deleteMapper.removeBasicDraftByDraNo(draNo);
	}
}
