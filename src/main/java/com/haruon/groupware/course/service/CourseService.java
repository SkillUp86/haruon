package com.haruon.groupware.course.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.course.dto.CourseDto;
import com.haruon.groupware.course.entity.EducationFile;
import com.haruon.groupware.course.mapper.CourseMapper;
import com.haruon.groupware.user.entity.EmpEntity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CourseService {
	@Autowired CourseMapper courseMapper;
	
	// 교육 삭제
	public void deleteCourse(Integer eduNo, String path) {
		// 파일 삭제
		List<EducationFile> list = courseMapper.selectCourseFiles(eduNo);
		courseMapper.deleteCourseFiles(eduNo);
		// 교육 삭제
		int row = courseMapper.deleteCourse(eduNo);
		// 물리적 파일 삭제
		if(row == 1 && list != null && list.size() > 0) { // 교육 삭제 후 물리파일이 있다면 삭제
			for(EducationFile ef : list) {
				String fullname = path + ef.getFileName() + "." + ef.getExt();
				File f = new File(fullname);
				f.delete();
			}
		}
	}
	
	// 교육 수정
	public Integer modifyCourse(CourseDto courseDto, String path) {
		// 키값
		Integer eduNo = courseDto.getEduNo();
		log.debug("eduNo =====> " + courseDto.getEduNo());
		
		log.debug("courseDto.getEducationFile() =========>" + courseDto.getEducationFile());
		log.debug("courseDto.getEducationFile size() =========>" + courseDto.getEducationFile().size());
		log.debug("courseDto.getEducationFile getSize() =========>" + courseDto.getEducationFile().get(0).getSize());
		if(courseDto.getEducationFile().get(0).getSize() > 0) {
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
		return courseMapper.modifyCourse(courseDto);
	}
	
	
	// 교육 수정 시 첨부파일 삭제
	public void deleteCourseFile(Integer edufNo, String path) {
		// 파일 이름
		EducationFile courseFile = courseMapper.selectCourseFile(edufNo);
		int row = courseMapper.deleteCourseFile(edufNo); // DB 삭제
		if(row == 1) { // DB에서 파일삭제가 되었다면
			String fullname = path + courseFile.getFileName() + "." + courseFile.getExt();
			File f = new File(fullname);
			f.delete();
		}
	}
	
	// 교육 상세 
	public CourseDto getCourse(Integer eduNo) {
		return courseMapper.selectCourse(eduNo);
	}
	public List<EducationFile> getCourseFiles(Integer eduNo) {
		return courseMapper.selectCourseFiles(eduNo);
	}
	
	// 교육 등록
	public void insertCourse(CourseDto courseDto, String path) {
		// 교육 NO 생성
		Integer addEdu = courseMapper.insertCourse(courseDto);
		
		// 키값
		Integer eduNo = courseDto.getEduNo();

		log.debug("courseDto.getEducationFile() =========>" + courseDto.getEducationFile());
		log.debug("courseDto.getEducationFile size() =========>" + courseDto.getEducationFile().size());
		log.debug("courseDto.getEducationFile getSize() =========>" + courseDto.getEducationFile().get(0).getSize());
		
		if(addEdu == 1 && courseDto.getEducationFile().get(0).getSize() > 0) {
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
