package com.haruon.groupware.util;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.approval.mapper.ApprovalMapper;

public class ApprovalFileUpload {

	public static void getApprovalFileupload(String path, int draNo, List<MultipartFile> file, ApprovalMapper approvalMapper) {
		for (MultipartFile f : file) {
			if (f.isEmpty()) {
				continue;
			}
			DraftFileEntity draftFile = new DraftFileEntity();
			draftFile.setDraNo(draNo);
			draftFile.setKind(f.getContentType());
			draftFile.setSize(f.getSize());
			int dotInx = f.getOriginalFilename().lastIndexOf(".");
			String originName = f.getOriginalFilename().substring(0, dotInx);
			String fileName = UUID.randomUUID().toString().replace("-", "");
			String ext = f.getOriginalFilename().substring(dotInx + 1);
			draftFile.setFileName(fileName);
			draftFile.setOriginName(originName);
			draftFile.setExt(ext);
			
			int draftFileRow = approvalMapper.saveDraftFileByUser(draftFile);
			if (draftFileRow == 1) {
				try {
					f.transferTo(new File(path + fileName + "." + ext));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					throw new IllegalArgumentException("파일이 없습니다");
				}
			}
		}
	}
}
