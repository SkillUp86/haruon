package com.haruon.groupware.meetingroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.meetingroom.dto.MeetingRoomDto;
import com.haruon.groupware.meetingroom.entity.MeetingRoom;
import com.haruon.groupware.meetingroom.entity.MeetingRoomFile;

@Mapper 
public interface MeetingRoomMapper {
	
	List<MeetingRoom>meetingroomList();

	Integer addMeetingroom (MeetingRoom meetingRoom);
	
	
	Integer addMeetingroomFile(MeetingRoomFile meetingRoomFile);
	
	
	Integer deleteMeetingroom (Integer meeNo);
	
	Integer deleteMeetingroomFile(Integer meeNo);
	
	Integer updateMeetingroom (MeetingRoom meeNo);
	
	MeetingRoomDto meetingroomOne(Integer meeNo);
	
	Integer updateMeetingroomFile(MeetingRoomFile meetingRoomFile);
	
	MeetingRoomFile findMeetingRoomFileByMeeNo(Integer meeNo);
}
