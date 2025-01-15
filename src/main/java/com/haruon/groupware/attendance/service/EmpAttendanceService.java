package com.haruon.groupware.attendance.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.dto.RequestAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseBusinessTripList;
import com.haruon.groupware.attendance.dto.ResponseLeaveList;
import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import static com.haruon.groupware.attendance.service.AttendanceServiceSupport.*;

import java.text.ParseException;
import java.util.List;

@Slf4j
@Service
@Transactional
public class EmpAttendanceService {
	@Autowired private AttendanceMapper attendanceMapper;
	
	// 근태리스트(월별) - empNo : 개인
    public List<ResponseAttendanceList> findEmpAttendanceListByMonth(Integer empNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = getMonthEndOrYesterday(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findEmpAttendanceListByMonth - 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findEmpAttendanceListByMonth - 서비스 단" + requestAttendanceList.toString());
    	return attendanceMapper.findAttendanceListByMonth(requestAttendanceList);
    }
    
	// 휴가 신청 리스트(월별) - empNo : 개인
    public List<ResponseLeaveList> findtEmpLeaveReqListByMonth(Integer empNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findtEmpLeaveReqListByMonth - 날짜 파싱 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findEmpAttendanceListByMonth - 서비스 단" + requestAttendanceList.toString());
    	return attendanceMapper.findtLeaveReqListByMonth(requestAttendanceList);
    }
    
    // 출장 신청 리스트(월별) - empNo : 개인
    public List<ResponseBusinessTripList> findEmpBusinessTripReqListByMonth(Integer empNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findDeptBusinessTripReqListByMonth - 날짜 파싱 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findEmpBusinessTripReqListByMonth - 서비스 단" + requestAttendanceList.toString());
    	return attendanceMapper.findBusinessTripListByMonth(requestAttendanceList);
    }
	
	// 메인페이지 오늘의 출/퇴근 시간 조회
	public Attendance findAttendanceByEmp(Integer empNo) {
		return attendanceMapper.findAttendanceByEmp(empNo);
	}

}
