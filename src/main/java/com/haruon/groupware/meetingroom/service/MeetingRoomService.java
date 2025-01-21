package com.haruon.groupware.meetingroom.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.entity.MeetingRoomFile;
import com.haruon.groupware.meetingroom.mapper.MeetingRoomMapper;
import com.haruon.groupware.meetingroom.mapper.ReservationMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class MeetingRoomService {
	
	@Autowired MeetingRoomMapper meetingRoomMapper;
	@Autowired ReservationMapper reservationMapper;
	
	public List<MeetingRoom> meetingroomList(){
		return meetingRoomMapper.meetingroomList();
	}
	
	
	public Integer deleteMeetingroom (Integer meeNo) {
		return meetingRoomMapper.deleteMeetingroom(meeNo);
	}
	
	public Integer deletereservation (Integer meeNo) {
		return reservationMapper.deleteReservation(meeNo);
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


	
}