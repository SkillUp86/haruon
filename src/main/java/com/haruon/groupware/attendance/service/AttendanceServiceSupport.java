package com.haruon.groupware.attendance.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AttendanceServiceSupport {

	// 시간을 형식을 Long으로 파싱하는 메서드 
	static Long parsingDate(String paramDate) {
		// 시간 비교 및 연산을 위한 DateTime 포맷팅 형식
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		SimpleDateFormat dateFormat4 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		try {
			return dateFormat4.parse(paramDate).getTime();
		} catch(ParseException e1) {
			try {
				return dateFormat3.parse(paramDate).getTime();
			} catch(Exception e2) {
				try {
	                return dateFormat2.parse(paramDate).getTime();
	            } catch(ParseException e3) {
	            	try {
	            		return dateFormat1.parse(paramDate).getTime();
	            	} catch(ParseException e4) {
		            	log.debug("DateFormat으로 지정하지 않는 형식, Parsing 오류(AttendanceService - parsingDate 오류)");
		                e3.printStackTrace();
		                return null;
	            	}
	            }
			}
		}
	}

	// 근태리스트 조회조건(To)에 사용 : 조회를 원하는 달의 말일 계산 + 어제날짜와 비교
	static String getMonthEndOrYesterday(String beginDate) throws ParseException {
		String yesterDay = LocalDate.now(ZoneId.of("Asia/Seoul"))
					                .minusDays(1)
					                .toString();
	    String end = calculateMonthEnd(beginDate);
	    
		return calculateHours(end, yesterDay) > 0 ? end : yesterDay;
	}

	// 두 시간 간격 계산
	static Integer calculateHours(String startTime, String endTime) {
		Long end = 0L;
		Long start = 0L;
		end = parsingDate(endTime);
		start = parsingDate(startTime);
		
		log.debug("end = {}, start = {}", end, start);
		
		return (int) ( (end - start) / (1000 * 60 * 60));
	}

	// 연차 및 출장 리스트 조회조건(To)에 사용 : 조회를 원하는 달의 말일 계산
	static String calculateMonthEnd(String beginDate) throws ParseException {
		LocalDate date = LocalDate.parse(beginDate.trim());
		String end = LocalDate.of(date.getYear()
				, date.getMonth()
				, LocalDate.of(date.getYear(), date.getMonth(), 1).lengthOfMonth())
				.toString();
		
		return end;
	}

}
