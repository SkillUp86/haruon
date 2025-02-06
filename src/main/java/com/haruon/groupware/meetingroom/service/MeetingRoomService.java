package com.haruon.groupware.meetingroom.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.entity.MeetingRoomFile;
import com.haruon.groupware.meetingroom.mapper.MeetingRoomMapper;
import com.haruon.groupware.meetingroom.mapper.ReservationMapper;
import com.haruon.groupware.schedule.mapper.ScheduleMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class MeetingRoomService {
	
	@Autowired MeetingRoomMapper meetingRoomMapper;
	@Autowired ReservationMapper reservationMapper;
	@Autowired ScheduleMapper scheduleMapper;
	
	public List<MeetingRoom> meetingroomList(){
		return meetingRoomMapper.meetingroomList();
	}
	
	
	public Integer deleteMeetingroom(Integer meeNo, String path) {
	    // 관련 파일 조회
	    MeetingRoomFile meetingRoomFile = meetingRoomMapper.findMeetingRoomFileByMeeNo(meeNo);
	    
	    int reservationCount = reservationMapper.countReservationsByMeeNo(meeNo);
	    if (reservationCount > 0) {
	        throw new IllegalStateException("예약이 존재하는 회의실은 삭제할 수 없습니다");
	    }

	    if (meetingRoomFile != null) {
	        // 파일 경로 생성
	        String filePath = path + meetingRoomFile.getFileName() + "." + meetingRoomFile.getExt();

	        // 파일 삭제
	        File file = new File(filePath);
	        if (file.exists() && file.isFile()) {
	            if (!file.delete()) {
	                throw new RuntimeException("파일 삭제 실패: " + filePath);
	            }
	        }

	        // DB에서 파일 정보 삭제
	        int fileDeleteResult = meetingRoomMapper.deleteMeetingroomFile(meeNo);
	        if (fileDeleteResult <= 0) {
	            throw new RuntimeException("파일 DB 삭제 실패: meeNo=" + meeNo);
	        }
	    }

	    // 회의실 삭제
	    int meetingroomDeleteResult = meetingRoomMapper.deleteMeetingroom(meeNo);
	    if (meetingroomDeleteResult <= 0) {
	        throw new RuntimeException("회의실 삭제 실패: meeNo=" + meeNo);
	    }

	    return meetingroomDeleteResult;
	}

	
	public void addMeetingroom(MeetingRoom meetingRoom, MultipartFile file, String path) {
	    // 1. 회의실 정보 저장
	    meetingRoomMapper.addMeetingroom(meetingRoom); 
	    log.debug("Generated meeNo: {}", meetingRoom.getMeeNo());

	    if (meetingRoom.getMeeNo() == null) {
	        throw new RuntimeException("회의실 번호 생성 실패");
	    }

	    // 2. 파일 처리
	    if (file != null && !file.isEmpty()) {
	        String originalFilename = file.getOriginalFilename();
	        if (originalFilename == null || originalFilename.isEmpty()) {
	            throw new RuntimeException("유효하지 않은 파일 이름");
	        }

	        int dotIdx = originalFilename.lastIndexOf(".");
	        if (dotIdx == -1) {
	            throw new RuntimeException("파일 확장자를 찾을 수 없음");
	        }

	        String originName = originalFilename.substring(0, dotIdx);
	        String ext = originalFilename.substring(dotIdx + 1);
	        String filename = UUID.randomUUID().toString().replace("-", "");

	        MeetingRoomFile meetingRoomFile = new MeetingRoomFile();
	        meetingRoomFile.setMeeNo(meetingRoom.getMeeNo());
	        meetingRoomFile.setKind(file.getContentType());
	        meetingRoomFile.setSize(file.getSize());
	        meetingRoomFile.setOriginalName(originName);
	        meetingRoomFile.setFileName(filename);
	        meetingRoomFile.setExt(ext);

	        meetingRoomMapper.addMeetingroomFile(meetingRoomFile);

	        // 저장 경로 확인 및 파일 저장
	        File directory = new File(path);
	        if (!directory.exists()) {
	            boolean created = directory.mkdirs();
	            if (!created) {
	                throw new RuntimeException("파일 저장 경로 생성 실패");
	            }
	        }

	        try {
	            file.transferTo(new File(directory, filename + "." + ext));
	        } catch (IOException e) {
	            log.error("파일 저장 중 IOException 발생", e);
	            throw new RuntimeException("파일 저장 중 오류 발생", e);
	        }
	    }
	}
	
	public void updateMeetingroom(MeetingRoom meetingRoom) {
	    int updateResult = meetingRoomMapper.updateMeetingroom(meetingRoom);
	    if (updateResult <= 0) {
	        throw new RuntimeException("회의실 수정 실패: meeNo=" + meetingRoom.getMeeNo());
	    }
	}

	public void profileUpload(MultipartFile file, Integer meeNo, String path) {
	    MeetingRoomFile meetingRoomFile = meetingRoomMapper.findMeetingRoomFileByMeeNo(meeNo);
	    if (meetingRoomFile == null) {
	        insertFile(file, meeNo, path);
	        return;
	    }

	    // 기존 파일 삭제 후 새 파일 추가
	    String filename = path + meetingRoomFile.getFileName() + "." + meetingRoomFile.getExt();
	    File f = new File(filename);
	    f.delete();
	    int row = meetingRoomMapper.deleteMeetingroomFile(meeNo);
	    if (row == 1) {
	        insertFile(file, meeNo, path);
	    }
	}

	private void insertFile(MultipartFile file, Integer meeNo, String path) {
	    if (file.getOriginalFilename().isEmpty()) {
	        return;
	    }
	    MeetingRoomFile meetingRoomFile = new MeetingRoomFile();
	    meetingRoomFile.setMeeNo(meeNo);
	    meetingRoomFile.setKind(file.getContentType());
	    meetingRoomFile.setSize(file.getSize());
	    int dotInx = file.getOriginalFilename().lastIndexOf(".");
	    String originName = file.getOriginalFilename().substring(0, dotInx);
	    String fileName = UUID.randomUUID().toString().replace("-", "");
	    String ext = file.getOriginalFilename().substring(dotInx + 1);
	    meetingRoomFile.setFileName(fileName);
	    meetingRoomFile.setOriginalName(originName);
	    meetingRoomFile.setExt(ext);
	    int row = meetingRoomMapper.addMeetingroomFile(meetingRoomFile);
	    if (row == 1) {
	        try {
	            file.transferTo(new File(path + fileName + "." + ext));
	        } catch (IllegalStateException | IOException e) {
	            throw new IllegalArgumentException("파일 업로드 중 오류 발생", e);
	        }
	    }
	}
	
    // 회의실 정보 조회
    public MeetingRoomDto meetingroomOne(Integer meeNo) {
        return meetingRoomMapper.meetingroomOne(meeNo);
    }

}