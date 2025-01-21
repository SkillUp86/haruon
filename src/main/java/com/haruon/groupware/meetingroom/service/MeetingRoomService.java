package com.haruon.groupware.meetingroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.entity.MeetingRoomFile;
import com.haruon.groupware.meetingroom.mapper.MeetingRoomMapper;
import com.haruon.groupware.meetingroom.mapper.ReservationMapper;

@Service
@Transactional
public class MeetingRoomService {
	
	@Autowired MeetingRoomMapper meetingRoomMapper;
	@Autowired ReservationMapper reservationMapper;
	
	public List<MeetingRoom> meetingroomList(){
		return meetingRoomMapper.meetingroomList();
	}
	
	public Integer addMeetingroom(MeetingRoom meetingRoom) {
		return meetingRoomMapper.addMeetingroom(meetingRoom);
	}
	
	public Integer addMeetingroomFile(MeetingRoomFile meetingRoomFile) {
		return meetingRoomMapper.addMeetingroomFile(meetingRoomFile);
	}
	
	public Integer deleteMeetingroom (Integer meeNo) {
		return meetingRoomMapper.deleteMeetingroom(meeNo);
	}
	
	public Integer deletereservation (Integer meeNo) {
		return reservationMapper.deleteReservation(meeNo);
	}
	
}