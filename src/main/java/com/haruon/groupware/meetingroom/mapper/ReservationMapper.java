package com.haruon.groupware.meetingroom.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {
	
    Integer findReservationByScheduleNo(Integer schNo);

	Integer deleteReservation(Integer resNo);


}
