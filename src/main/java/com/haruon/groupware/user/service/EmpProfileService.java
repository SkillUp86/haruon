package com.haruon.groupware.user.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.entity.EmpFile;
import com.haruon.groupware.user.mapper.EmpMapper;
import com.haruon.groupware.user.mapper.EmprofileMapper;

@Transactional
@Service
public class EmpProfileService {

	private final EmprofileMapper emprofileMapper;
	private final EmpMapper empMapper;

	public EmpProfileService(EmprofileMapper emprofileMapper, EmpMapper empMapper) {
		this.emprofileMapper = emprofileMapper;
		this.empMapper = empMapper;
	}

	// 프로필 보기
	public EmpFile getProfileByUser(String email) {
		return emprofileMapper.findEmpFileByUser(email);
	}

	// 프로필 업로드
	public void profileUpload(MultipartFile file, String email, String path) {
		EmpFile empFile = emprofileMapper.findEmpFileByUser(email);
		if (empFile == null) {
			insertFile(file, email, path);
			return;
		}
		// 사진 있을시 삭제후 추가
		String filname = path + empFile.getFileName() + "." + empFile.getExt();
		File f = new File(filname);
		f.delete();
		int row = emprofileMapper.removeProfileFile(email);
		if (row == 1) {
			insertFile(file, email, path);
		}
		updateSecurityContext(email);
	}

	private void updateSecurityContext(String email) {
		// DB에서 최신 사용자 정보 가져오기
		EmpEntity empEntity = empMapper.findByEmp(email);
		EmpFile updatedProfile = emprofileMapper.findEmpFileByUser(email);

		// 새로운 CustomUserDetails 생성
		CustomUserDetails updatedUserDetails = new CustomUserDetails(empEntity, updatedProfile);

		// 새로운 Authentication 객체 생성
		Authentication newAuth = new UsernamePasswordAuthenticationToken(updatedUserDetails, null, updatedUserDetails.getAuthorities());
		// SecurityContext 업데이트
		SecurityContextHolder.getContext().setAuthentication(newAuth);
	}

	private void insertFile(MultipartFile file, String email, String path) {
		if (file.getOriginalFilename().isEmpty()) {
			return;
		}
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int empNo = details.getEmpNo();
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
