package com.haruon.groupware.meetingroom.service;	

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.meetingroom.dto.MyReservationDto;
import com.haruon.groupware.meetingroom.entity.Reservation;
import com.haruon.groupware.meetingroom.mapper.ReservationMapper;
import com.haruon.groupware.schedule.dto.ScheduleDto;
import com.haruon.groupware.schedule.mapper.ScheduleMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ReservationService {
	@Autowired ScheduleMapper scheduleMapper;
	@Autowired ApprovalMapper approvalMapper;
	@Autowired ReservationMapper reservationMapper;
	
	 public List<ResponseEmployee> getEmployeesByDept(int deptNo, int empNo) {
	        return approvalMapper.findEmpByDept(deptNo, empNo);
	    }


	 public List<CommonCode> ReservationTime(Integer meeNo, String revDate) {
		    if (revDate == null || revDate.isEmpty()) {
		        return new ArrayList<>(); // 빈 리스트 반환
		    }

		    Reservation reservation = new Reservation();
		    reservation.setMeeNo(meeNo);
		    reservation.setRevDate(revDate);
		    

		    return reservationMapper.revTimeList(reservation);
		}
	 
	 public void addReservationAndSchedule(ScheduleDto scheduleDto, String attendees, Model model) {
		    CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		    if (scheduleDto.getRevDate() == null || scheduleDto.getRevTime() == null ) {
		        throw new IllegalArgumentException("예약 날짜, 시간 및 시간 설명이 필요합니다.");
		    }
		    scheduleDto.getRevTimeDescript();
		    log.debug("RevTimeDescript: {}", scheduleDto.getRevTimeDescript());
		    scheduleDto.setKind("G04");
		    scheduleDto.setTitle("회의");

		    // 스케줄 추가
		    int schNo = scheduleMapper.addMeetingroomSchedule(scheduleDto);

		    // 예약(reservation) 추가
		    Reservation reservation = new Reservation();
		    reservation.setMeeNo(scheduleDto.getMeeNo());
		    reservation.setRevDate(scheduleDto.getRevDate());
		    reservation.setRevTime(scheduleDto.getRevTime());
		    reservation.setSchNo(schNo);
		    reservation.setEmpNo(userDetails.getEmpNo());
		    reservationMapper.addReservation(reservation);

		    // 참석자 추가
		    String[] attendeeList = attendees.split(",");
		    for (String attendeeEmpNo : attendeeList) {
		        try {
		            int attendeeNo = Integer.parseInt(attendeeEmpNo.trim());
		            scheduleMapper.addScheduleAttendance(schNo, attendeeNo);
		        } catch (NumberFormatException e) {
		            // 잘못된 숫자 형식의 참석자 번호가 포함된 경우 처리
		            throw new IllegalArgumentException("참석자 번호는 숫자 형식이어야 합니다: " + attendeeEmpNo, e);
		        }
		    }
		}
	 public List<MyReservationDto>MyReservationList(){
		 CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int empNo = userDetails.getEmpNo();
		 return reservationMapper.myReservationList(empNo);
	 }
	 
	 public Integer deleteReservation(Integer schNo) {
		    Integer resNo = reservationMapper.findReservationByScheduleNo(schNo);
		    if (resNo != null) {
		        Integer reservationResult = reservationMapper.deleteReservation(resNo);
		        if (reservationResult < 1) {
		            log.debug("예약 삭제 실패: resNo " + resNo);
		        }
		    }
		    // 출석 삭제 (출석 데이터가 없는 경우에도 예외를 던지지 않고 넘어감)
		    Integer attendanceResult = scheduleMapper.deleteScheduleAttendance(schNo);
		    if (attendanceResult < 0) { 
		       log.debug("출석 데이터가 없거나 삭제되지 않았습니다. schNo: " + schNo);
		    }
		    // 스케줄 삭제
		    Integer scheduleResult = scheduleMapper.deleteSchedule(schNo);
		    if (scheduleResult < 1) {
		       log.debug("스케줄 삭제 실패: schNo " + schNo);
		        return 0; 
		    }
		    return scheduleResult; 
		}

	 

	}

