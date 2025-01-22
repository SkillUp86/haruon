package com.haruon.groupware.meetingroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.mapper.ApprovalMapper;

@Service
public class ReservationService {
	
	@Autowired ApprovalMapper approvalMapper;
	
	 public List<ResponseEmployee> getEmployeesByDept(int deptNo, int empNo) {
	        return approvalMapper.findEmpByDept(deptNo, empNo);
	    }

}
