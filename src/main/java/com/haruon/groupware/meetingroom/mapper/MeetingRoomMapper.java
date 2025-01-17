package com.haruon.groupware.meetingroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.meetingroom.entity.MeetingRoom;

@Mapper 
public interface MeetingRoomMapper {
	
	List<MeetingRoom>meetingroomList();

}
