package com.haruon.groupware.attendance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.dto.RequestAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseBusinessTripList;
import com.haruon.groupware.attendance.dto.ResponseLeaveList;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import com.haruon.groupware.user.mapper.EmpMapper;
import lombok.extern.slf4j.Slf4j;
import static com.haruon.groupware.attendance.service.AttendanceServiceSupport.*;

import java.text.ParseException;
import java.util.List;

@Slf4j
@Service
@Transactional
public class DeptAttendanceService {
	@Autowired private AttendanceMapper attendanceMapper;
	@Autowired private EmpMapper empMapper;
	
	// 근태리스트(월별) - deptNo : 부서원 전부
	public List<ResponseAttendanceList> findDeptAttendanceListByMonth(Integer deptNo, String yearMonth) {
		String begin = yearMonth + "-01";
	    String end = null;
	    try {
			end = getMonthEndOrYesterday(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findDeptAttendanceListByMonth - 예외 발생");
			e.printStackTrace();
		}
		
	    
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setDeptNo(deptNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		
		return attendanceMapper.findAttendanceListByMonth(requestAttendanceList);
	}
	// 출장 신청 리스트(월별) - deptNo : 부서원 전부
	public List<ResponseBusinessTripList> findDeptBusinessTripReqListByMonth(Integer deptNo, String yearMonth) {
		String begin = yearMonth + "-01";
	    String end = null;
	    try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findDeptBusinessTripReqListByMonth - 파싱 예외 발생");
			e.printStackTrace();
		}
	    
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setDeptNo(deptNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findDeptBusinessTripReqListByMonth - 서비스 단" + requestAttendanceList.toString());
		
		return attendanceMapper.findBusinessTripListByMonth(requestAttendanceList);
	}
	
	// 휴가 신청 리스트(월별) - deptNo : 부서원 전부
	public List<ResponseLeaveList> findtDeptLeaveReqListByMonth(Integer deptNo, String yearMonth) {
		String begin = yearMonth + "-01";
	    String end = null;
	    try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findtDeptLeaveReqListByMonth - 파싱 예외 발생");
			e.printStackTrace();
		}
		
	    
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setDeptNo(deptNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		
		return attendanceMapper.findtLeaveReqListByMonth(requestAttendanceList);
	}

}
