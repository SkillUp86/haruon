package com.haruon.groupware.meetingroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.mapper.MeetingRoomMapper;

@Service
@Transactional
public class MeetingRoomService {
	
	@Autowired MeetingRoomMapper meetingRoomMapper;
	
	public List<MeetingRoom> meetingroomList(){
		return meetingRoomMapper.meetingroomList();
	}

}
