package com.haruon.groupware.course.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.course.dto.CourseDto;
import com.haruon.groupware.course.entity.Education;
import com.haruon.groupware.course.entity.EducationFile;
import com.haruon.groupware.course.mapper.CourseMapper;
import com.haruon.groupware.user.entity.EmpEntity;

@Service
@Transactional
public class CourseService {
	@Autowired CourseMapper courseMapper;
	
	
	// 교육 상세 
	public CourseDto getCourse(Integer eduNo) {
		return courseMapper.selectCourse(eduNo);
	}
	public List<EducationFile> getCourseFile(Integer eduNo) {
		return courseMapper.selectCourseFile(eduNo);
	}
	
	// 교육 등록
	public void insertCourse(CourseDto courseDto, String path) {
		// 교육 NO 생성
		Integer addEdu = courseMapper.insertCourse(courseDto);
		
		// 키값
		Integer eduNo = courseDto.getEduNo();
		
		// 
		if(addEdu == 1 && courseDto.getEducationFile() != null) {
			// 파일 입력
			List<MultipartFile> file = courseDto.getEducationFile();
			for (MultipartFile f : file) {
				EducationFile eduFile = new EducationFile();
				eduFile.setEduNo(eduNo);
				eduFile.setKind(f.getContentType());
				eduFile.setSize(f.getSize());
				String filename = UUID.randomUUID().toString().replace("-", "");
				eduFile.setFileName(filename);
				int dotIdx = f.getOriginalFilename().lastIndexOf("."); // (해당하는 점을 찾아내서
				String originname = f.getOriginalFilename().substring(0, dotIdx);
				String ext = f.getOriginalFilename().substring(dotIdx + 1);
				eduFile.setOriginName(originname);
				eduFile.setExt(ext);
				
				int eduFileRow = courseMapper.insertCourseFile(eduFile);
				if (eduFileRow == 1) {
					// 물리적 파일 저장
					try {
						f.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						// -> try에서 작동하는 예외 말고 다른 예외를 인위적으로 발생시켜서 알림
						throw new RuntimeException();
					} 
				}
			}
		}
	}
	
	// 교육 담당자 리스트
	public List<EmpEntity> getEmpList(Integer deptNo) {
		return courseMapper.selectEmpList(deptNo);
	}
	
	// 교육 조회
	public List<CourseDto> getCourseList() {
		return courseMapper.selectCourseList();
	}
	
}
