package com.haruon.groupware.user.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.haruon.groupware.user.entity.EmpFile;
import com.haruon.groupware.user.mapper.EmprofileMapper;

@Transactional
@Service
public class EmpProfileService {

	private final EmprofileMapper emprofileMapper;

	public EmpProfileService(EmprofileMapper emprofileMapper) {
		this.emprofileMapper = emprofileMapper;
	}

	// 프로필 보기
	public EmpFile getProfileByUser(int empNo) {
		return emprofileMapper.findEmpFileByUser(empNo);
	}

	// 프로필 업로드
	public void profileUpload(MultipartFile file, int empNo, String path) {
		EmpFile empFile = emprofileMapper.findEmpFileByUser(empNo);
		if (empFile == null) {
			insertFile(file, empNo, path);
			return;
		}
		// 사진 있을시 삭제후 추가
		String filname = path + empFile.getFileName() + "." + empFile.getExt();
		File f = new File(filname);
		f.delete();
		int row = emprofileMapper.removeProfileFile(empNo);
		if (row == 1) {
			insertFile(file, empNo, path);
		} 
	}

	private void insertFile(MultipartFile file, int empNo, String path) {
		if (file.getOriginalFilename().isEmpty()) {
			return;
		}
		EmpFile empFile = new EmpFile();
		empFile.setEmpNo(empNo);
		empFile.setKind(file.getContentType());
		empFile.setSize(file.getSize());
		int dotInx = file.getOriginalFilename().lastIndexOf(".");
		String originName = file.getOriginalFilename().substring(0, dotInx);
		String fileName = UUID.randomUUID().toString().replace("-", "");
		String ext = file.getOriginalFilename().substring(dotInx + 1);
		empFile.setFileName(fileName);
		empFile.setOriginalName(originName);
		empFile.setExt(ext);
		int row = emprofileMapper.saveProfileByUser(empFile);
		if (row == 1) {
			try {
				file.transferTo(new File(path + fileName + "." + ext));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				throw new IllegalArgumentException("파일이 없습니다");
			}
		}
	}
}
