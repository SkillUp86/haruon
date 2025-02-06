	package com.haruon.groupware.meetingroom.mapper;
	
	import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.meetingroom.dto.MyReservationDto;
import com.haruon.groupware.meetingroom.entity.Reservation;
	
	@Mapper
	public interface ReservationMapper {
		
	    Integer findReservationByScheduleNo(Integer schNo);
	
		Integer deleteReservation(Integer resNo);
		
		Integer deleteMyReservation(Integer schNo);
		
		List<CommonCode> revTimeList(Reservation reservation);
		
		int addReservation(Reservation reservation);
		
		List<MyReservationDto> myReservationList(int empNo);
		
		Integer findReservationresNo(Integer schNo);

		int countReservationsByMeeNo(Integer meeNo);
		


	}
