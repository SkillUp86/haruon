package com.haruon.groupware.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;
import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.mapper.ScheduleMapper;

@Service
@Transactional
public class ScheduleService {
	
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired CommonMapper commonMapper;
	
	public List<Schedules> schedulesList(){
		return scheduleMapper.schedulesList();	
	}
	

	public int addSchedule(Schedules schedule) {
        return scheduleMapper.addSchedule(schedule);
    }
		
	public List<CommonCode> kind(String parentCode){
		return commonMapper.findByParentCode(parentCode);
		
	}
	public Integer deleteSchedule(Integer schNo) {
        return scheduleMapper.deleteSchedule(schNo);  
    }
	
	public Integer updateSchedule (Schedules schedules) {
		return scheduleMapper.updateSchedule(schedules);
	}
	
	public Schedules scheduleOne (Integer schNo) {
		return scheduleMapper.scheduleOne(schNo);
	}


	
	
}
