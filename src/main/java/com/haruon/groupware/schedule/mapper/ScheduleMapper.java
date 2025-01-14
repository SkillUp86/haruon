package com.haruon.groupware.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.schedule.entity.Schedules;

import com.haruon.groupware.schedule.entity.ScheduleAttendance;



@Mapper
public interface ScheduleMapper {
	List<Schedules> schedulesList();
	
	int addSchedule (Schedules schedules);
	
	Integer deleteScheduleAttendance(ScheduleAttendance schNo);
	
	Integer deleteSchedule (Schedules schNo);
}
