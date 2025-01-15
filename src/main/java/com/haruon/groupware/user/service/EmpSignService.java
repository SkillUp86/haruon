package com.haruon.groupware.user.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.user.entity.SignFile;
import com.haruon.groupware.user.mapper.EmpSignMapper;

@Transactional
@Service
public class EmpSignService {
	private final EmpSignMapper empSignMapper;

	public EmpSignService(EmpSignMapper empSignMapper) {
		this.empSignMapper = empSignMapper;
	}

	public boolean saveSign(String sign, String path) {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int empNo = details.getEmpNo();
		byte[] decodedBytes = Base64.getDecoder().decode(sign.split(",")[1]);
		long fileSize = decodedBytes.length;
		String filename = UUID.randomUUID().toString().replace("-", "");
		String ext = "png";
		SignFile signByEmpNo = empSignMapper.findSignByEmpNo(empNo);
		if(signByEmpNo != null) {
			String signFilename = path + signByEmpNo.getFileName() + "." + signByEmpNo.getExt();
			File f = new File(signFilename);
			f.delete();
			empSignMapper.removeSignByEmpNo(empNo);
			int saveSign = addSign(sign, path, empNo, fileSize, filename, ext);
			if(saveSign == 1) {
				return true;
			}
			return false;
		} else {
			int saveSign = addSign(sign, path, empNo, fileSize, filename, ext);
			if(saveSign == 1) {
				return true;
			}
			return false;
		}
		
	}

	private int addSign(String sign, String path, int empNo, long fileSize, String filename, String ext) {
		FileOutputStream fos = null;
		int row = 0;
		try {
			SignFile file = new SignFile();
			fos = new FileOutputStream(path + filename + "." + ext);
			fos.write(Base64.getDecoder().decode(sign.split(",")[1]));
			file.setEmpNo(empNo);
			file.setFileName(filename);
			file.setExt(ext);
			file.setSize(fileSize);
			row = empSignMapper.saveSignFile(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(); // 예외발생
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}
