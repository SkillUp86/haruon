package com.haruon.groupware.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.mapper.ScheduleMapper;

@Service
@Transactional
public class ScheduleService {
	
	@Autowired ScheduleMapper scheduleMapper;
	
	public List<Schedules> schedulesList(){
		return scheduleMapper.schedulesList();	
	}
}
