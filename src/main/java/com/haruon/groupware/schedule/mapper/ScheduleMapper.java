package com.haruon.groupware.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.schedule.dto.ScheduleDto;
import com.haruon.groupware.schedule.entity.Schedules;



@Mapper
public interface ScheduleMapper {
	List<Schedules> schedulesList(int empNo);
	
	int addSchedule (Schedules schedules);
	
	Integer deleteSchedule (Integer schNo);
	
	
	Integer deleteScheduleAttendance (Integer schNo);
	
	Integer updateSchedule (Schedules schedules);
	
	Schedules scheduleOne (Integer schNo);

	int addScheduleAttendance(int schNo, int empNo);
	
	int addMeetingroomSchedule(ScheduleDto scheduleDto);

	Schedules scheduleOneByReservation(Integer schNo);
	
}
