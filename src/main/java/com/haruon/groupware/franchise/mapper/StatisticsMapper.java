package com.haruon.groupware.franchise.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.franchise.dto.FranchiseStatisticsDTO;
import com.haruon.groupware.franchise.entity.Franchise;

@Mapper
public interface StatisticsMapper {
	// 가맹점 등록건수 (전체, 올해, 이번달) - getFranchiseResgisterCnt
	FranchiseStatisticsDTO getFranchiseResgisterCnt();
	// 가맹점 운영여부 통계 - getFranchiseOpenYNStatus
	FranchiseStatisticsDTO getFranchiseOpenYNStatus();
	// 월별 매출 탑 3개 가맹점 - getTop3FranchiseSalesByMonth
	List<FranchiseStatisticsDTO> getTop3FranchiseSalesByMonth(String targetMonth);
	// 월별 매출 최저 3개 가맹점 - getBottom3FranchiseSalesByMonth
	List<FranchiseStatisticsDTO> getBottom3FranchiseSalesByMonth(String targetMonth);
	// 올해 월별 매출액 - getRevenueByMonthThisYear
	List<FranchiseStatisticsDTO> getRevenueByMonthThisYear(Franchise franchise);
	// 작년 월별 매출액 - getRevenueByMonthLastYear
	List<FranchiseStatisticsDTO> getRevenueByMonthLastYear(Franchise franchise);
}
