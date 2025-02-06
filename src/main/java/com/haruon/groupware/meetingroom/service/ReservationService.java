package com.haruon.groupware.meetingroom.service;	

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.meetingroom.dto.MyReservationDto;
import com.haruon.groupware.meetingroom.dto.RequestReservationDto;
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
	 
	 public void addReservationAndSchedule(int meeNo, RequestReservationDto reservationDto) {
         CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

         if (reservationDto.getRevDate() == null || reservationDto.getRevTime() == null ) {
             throw new IllegalArgumentException("예약 날짜, 시간 및 시간 설명이 필요합니다.");
         }
         String[] parts = reservationDto.getRevTime().split(",");
        String commonCode = parts[0]; // commonCode 추출
        String descript = parts[1]; // descript 추출
        ScheduleDto scheduleDto = new ScheduleDto();
        scheduleDto.setMeeNo(meeNo);
        scheduleDto.setContent(reservationDto.getContent());
        scheduleDto.setRevDate(reservationDto.getRevDate());
        scheduleDto.setRevTime(descript);   
         
         scheduleDto.setKind("G04");
         scheduleDto.setTitle("회의");

         // 스케줄 추가
         scheduleMapper.addMeetingroomSchedule(scheduleDto);
         
         int schNo = scheduleDto.getSchNo();
         // 예약(reservation) 추가
         Reservation reservation = new Reservation();
         reservation.setMeeNo(scheduleDto.getMeeNo());
         reservation.setRevDate(scheduleDto.getRevDate());
         reservation.setRevTime(commonCode);
         reservation.setSchNo(schNo);
         reservation.setEmpNo(userDetails.getEmpNo());
         reservationMapper.addReservation(reservation);

         // 참석자 추가
         String[] attendeeList = reservationDto.getAttendees().split(",");
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
		    log.info("Deleting reservation for schNo: {}", schNo);
		    Integer resNo = reservationMapper.findReservationByScheduleNo(schNo);
		    log.info("Found resNo: {}", resNo);

		    if (resNo != null) {
		        int reservationResult = reservationMapper.deleteMyReservation(resNo);
		        log.info("Deleted reservation. Result: {}", reservationResult);
		        if (reservationResult < 1) {
		            log.error("Failed to delete reservation with resNo: {}", resNo);
		            throw new RuntimeException("Failed to delete reservation");
		        }
		    }

		    int attendanceResult = scheduleMapper.deleteScheduleAttendance(schNo);
		    log.info("Deleted attendance. Result: {}", attendanceResult);

		    int scheduleResult = scheduleMapper.deleteSchedule(schNo);
		    log.info("Deleted schedule. Result: {}", scheduleResult);

		    if (scheduleResult < 1) {
		        log.error("Failed to delete schedule with schNo: {}", schNo);
		        throw new RuntimeException("Failed to delete schedule");
		    }

		    return scheduleResult;
		}
	 
	 public List<ResponseEmployee> findEmpDept(int deptNo, int empNo) {
			return approvalMapper.findEmpDept(deptNo, empNo);
		}
	}