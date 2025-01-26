package com.haruon.groupware.meetingroom.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.meetingroom.entity.Reservation;
import com.haruon.groupware.meetingroom.mapper.ReservationMapper;

@Service
public class ReservationService {
	
	@Autowired ApprovalMapper approvalMapper;
	@Autowired ReservationMapper reservationMapper;
	
	 public List<ResponseEmployee> getEmployeesByDept(int deptNo, int empNo) {
	        return approvalMapper.findEmpByDept(deptNo, empNo);
	    }


	 public List<String> ReservationTime(Integer meeNo, String revDate) {
		    if (revDate == null || revDate.isEmpty()) {
		        return new ArrayList<>(); // 빈 리스트 반환
		    }
		    Reservation reservation = new Reservation();
		    reservation.setMeeNo(meeNo);
		    reservation.setRevDate(revDate);

		    return reservationMapper.revTimeList(reservation);
		}
}
