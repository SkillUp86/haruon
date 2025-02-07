package com.haruon.groupware.franchise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.franchise.dto.FranchiseStatisticsDTO;
import com.haruon.groupware.franchise.entity.Franchise;
import com.haruon.groupware.franchise.mapper.StatisticsMapper;

@Service
@Transactional
public class StatisticsService {
	@Autowired StatisticsMapper statisticsMapper;
	
	// 가맹점 등록건수 (전체, 올해, 이번달)
	public FranchiseStatisticsDTO getFranchiseResgisterCnt() {
		return statisticsMapper.getFranchiseResgisterCnt();
	}
	
	//  가맹점 운영여부 통계
	public FranchiseStatisticsDTO getFranchiseOpenYNStatus() {
		return statisticsMapper.getFranchiseOpenYNStatus();
	}
	
	// 월별 매출 탑 3개 가맹점 
	public List<FranchiseStatisticsDTO> getTop3FranchiseSalesByMonth(String targetMonth) {
		return statisticsMapper.getTop3FranchiseSalesByMonth(targetMonth);
	}
	
	// 월별 매출 최저 3개 가맹점
	public List<FranchiseStatisticsDTO> getBottom3FranchiseSalesByMonth(String targetMonth) {
		return statisticsMapper.getBottom3FranchiseSalesByMonth(targetMonth);
	}
	
	// 전체 가맹점 - 올해 월별 매출액
	public List<FranchiseStatisticsDTO> getRevenueByMonthThisYear() {
		return statisticsMapper.getRevenueByMonthThisYear(new Franchise());
	}
	
	
	// 전체 가맹점 - 작년 월별 매출액 - getRevenueByMonthLastYear
	public List<FranchiseStatisticsDTO> getRevenueByMonthLastYear() {
		return statisticsMapper.getRevenueByMonthLastYear(new Franchise());
	}

	// 특정 가맹점 - 올해 월별 매출액
	public List<FranchiseStatisticsDTO> getRevenueByMonthThisYear(Integer franchiseNo) {
		Franchise franchise = new Franchise();
		franchise.setFraNo(franchiseNo);
		return statisticsMapper.getRevenueByMonthThisYear(franchise);
	}
	
	// 특정 가맹점 - 작년 월별 매출액 
	public List<FranchiseStatisticsDTO> getRevenueByMonthLastYear(Integer franchiseNo) {
		Franchise franchise = new Franchise();
		franchise.setFraNo(franchiseNo);
		return statisticsMapper.getRevenueByMonthLastYear(franchise);
	}

}
