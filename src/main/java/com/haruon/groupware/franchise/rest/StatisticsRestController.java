package com.haruon.groupware.franchise.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.franchise.dto.FranchiseStatisticsDTO;
import com.haruon.groupware.franchise.service.StatisticsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/franchise/statistics")
public class StatisticsRestController {
	@Autowired StatisticsService statisticsService;
	// 등록건수
	@GetMapping("/resgisterCount")
	public ResponseEntity<FranchiseStatisticsDTO> getFranchiseResgisterCnt() {
		FranchiseStatisticsDTO result = statisticsService.getFranchiseResgisterCnt();
		return ResponseEntity.ok(result);
	}
	// 운영여부
	@GetMapping("/openStatus")
	public ResponseEntity<FranchiseStatisticsDTO> getFranchiseOpenYNStatus() {
		FranchiseStatisticsDTO result = statisticsService.getFranchiseOpenYNStatus();
		return ResponseEntity.ok(result);
	}
	// 최고매출액 top3
	@GetMapping("/{targetMonth}/revenue/top")
	public ResponseEntity<List<FranchiseStatisticsDTO>> getRevenueTop3ByMonth(@PathVariable String targetMonth) {
		List<FranchiseStatisticsDTO> result = statisticsService.getTop3FranchiseSalesByMonth(targetMonth);
		return ResponseEntity.ok(result);
	}
	// 최저매출액 top3
	@GetMapping("/{targetMonth}/revenue/worst")
	public ResponseEntity<List<FranchiseStatisticsDTO>> getRevenueWorst3ByMonth(@PathVariable String targetMonth) {
		List<FranchiseStatisticsDTO> result = statisticsService.getBottom3FranchiseSalesByMonth(targetMonth);
		return ResponseEntity.ok(result);
	}
	// 올해 웗별 매출액
	@GetMapping("/thisYear/monthlyRevenue")
	public ResponseEntity<List<FranchiseStatisticsDTO>> getRevenueByMonthThisYear() {
		List<FranchiseStatisticsDTO> result = statisticsService.getRevenueByMonthThisYear();
		return ResponseEntity.ok(result);
	}
	// 작년 웗별 매출액	
	@GetMapping("/lastYear/monthlyRevenue")
	public ResponseEntity<List<FranchiseStatisticsDTO>> getRevenueByMonthLastYear() {
		List<FranchiseStatisticsDTO> result = statisticsService.getRevenueByMonthLastYear();
		return ResponseEntity.ok(result);
	}
	// 특정가맹점의 올해 웗별 매출액
	@GetMapping("/{fraNo}/thisYear/monthlyRevenue")
	public ResponseEntity<List<FranchiseStatisticsDTO>> getRevenueByMonthThisYear(@PathVariable Integer fraNo) {
		List<FranchiseStatisticsDTO> result = statisticsService.getRevenueByMonthThisYear(fraNo);
		return ResponseEntity.ok(result);
	}
	// 특정가맹점의 작년 웗별 매출액	
	@GetMapping("/{fraNo}/lastYear/monthlyRevenue")
	public ResponseEntity<List<FranchiseStatisticsDTO>> getRevenueByMonthLastYear(@PathVariable Integer fraNo) {
		List<FranchiseStatisticsDTO> result = statisticsService.getRevenueByMonthLastYear(fraNo);
		return ResponseEntity.ok(result);
	}

}
