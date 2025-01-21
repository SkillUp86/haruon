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
	
	
	public Integer deleteMeetingroom(Integer meeNo) {
	    // 1. 먼저 meetingroom_file 테이블에서 파일 정보 삭제
	    Integer fileDeleteResult = meetingRoomMapper.deleteMeetingroomFile(meeNo);
	    if (fileDeleteResult < 1) {
	    }

	    // 2. 예약 삭제
	    Integer reservationResult = reservationMapper.deleteReservation(meeNo);
	    if (reservationResult < 1) {
	    }
	    
	    // 3. 회의실 삭제
	    Integer meetingRoomResult = meetingRoomMapper.deleteMeetingroom(meeNo);
	    return meetingRoomResult;
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
	
	public void updateMeetingroom(MeetingRoom meetingRoom, MultipartFile meetingroomFile, String path) {
	    // 회의실 정보 수정
	    int updateResult = meetingRoomMapper.updateMeetingroom(meetingRoom);
	    if (updateResult <= 0) {
	        throw new RuntimeException("회의실 수정 실패: meeNo=" + meetingRoom.getMeeNo());
	    }

	    // 파일 처리
	    if (meetingroomFile != null && !meetingroomFile.isEmpty()) {
	        String originalFilename = meetingroomFile.getOriginalFilename();
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

	        // 파일 정보 엔티티 생성
	        MeetingRoomFile meetingRoomFileEntity = new MeetingRoomFile();
	        meetingRoomFileEntity.setMeeNo(meetingRoom.getMeeNo());
	        meetingRoomFileEntity.setKind(meetingroomFile.getContentType());
	        meetingRoomFileEntity.setSize(meetingroomFile.getSize());
	        meetingRoomFileEntity.setOriginalName(originName);
	        meetingRoomFileEntity.setFileName(filename);
	        meetingRoomFileEntity.setExt(ext);

	        // DB에 파일 정보 업데이트
	        int fileUpdateResult = meetingRoomMapper.updateMeetingroomFile(meetingRoomFileEntity);
	        if (fileUpdateResult <= 0) {
	            throw new RuntimeException("회의실 파일 수정 실패: meeNo=" + meetingRoom.getMeeNo());
	        }

	        // 파일 저장
	        File directory = new File(path);
	        if (!directory.exists() && !directory.mkdirs()) {
	            throw new RuntimeException("파일 저장 경로 생성 실패");
	        }

	        try {
	            meetingroomFile.transferTo(new File(directory, filename + "." + ext));
	        } catch (IOException e) {
	            log.error("파일 저장 중 IOException 발생", e);
	            throw new RuntimeException("파일 저장 중 오류 발생", e);
	        }
	    }
	}
    // 회의실 정보 조회
    public MeetingRoomDto meetingroomOne(Integer meeNo) {
        return meetingRoomMapper.meetingroomOne(meeNo);
    }

}