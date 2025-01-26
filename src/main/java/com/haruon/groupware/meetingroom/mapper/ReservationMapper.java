	package com.haruon.groupware.meetingroom.mapper;
	
	import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.meetingroom.entity.Reservation;
	
	@Mapper
	public interface ReservationMapper {
		
	    Integer findReservationByScheduleNo(Integer schNo);
	
		Integer deleteReservation(Integer resNo);
		
		List<String> revTimeList(Reservation reservation);

	}
