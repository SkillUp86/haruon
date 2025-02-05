package com.haruon.groupware.approval.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.dto.ResponseBusinessTrip;
import com.haruon.groupware.approval.dto.ResponseVacation;
import com.haruon.groupware.approval.mapper.ApprovalActionMapper;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.draft.dto.response.ResponseBusinessDraftDetail;
import com.haruon.groupware.draft.entity.BusinessTrip;
import com.haruon.groupware.draft.mapper.DraftMapper;
import com.haruon.groupware.schedule.entity.Schedules;
import com.haruon.groupware.schedule.mapper.ScheduleMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ApprovalActionService {

	private final ApprovalActionMapper approvalActionMapper;
	private final DraftMapper draftMapper;
	private final ScheduleMapper scheduleMapper;

	public ApprovalActionService(ApprovalActionMapper approvalActionMapper, DraftMapper draftMapper,
			ScheduleMapper scheduleMapper) {
		this.approvalActionMapper = approvalActionMapper;
		this.draftMapper = draftMapper;
		this.scheduleMapper = scheduleMapper;
	}

	// 반려사유 입력
	public int getRejectDescription(int draNo, String reasonDenial) {
		return approvalActionMapper.saveRejectDescript(draNo, reasonDenial);
	}

	// 중간 유효성 검사
	public boolean isAccessBymidApproval(int draNo) {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int empNo = details.getEmpNo();
		Integer midApp = approvalActionMapper.findMidApprovalByEmpNo(empNo, draNo).getMidApp();
		// 중간결재자가 아닐시 접근제한
		if (empNo == midApp) {
			return true;
		}
		return false;
	}

	// 최종 유효성 검사
	public boolean isAccessByFinalApproval(int draNo) {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int empNo = details.getEmpNo();
		// Integer midApp =
		// approvalActionMapper.findMidApprovalByEmpNo(empNo).getMidApp();
		Integer finalApp = approvalActionMapper.findFinalApprovalByEmpNo(empNo, draNo).getFinalApp();
		// 중간결재자가 아닐시 접근제한
		if (empNo == finalApp) {
			return true;
		}
		return false;
	}

	// 반려사유 권한이 있는지 확인
	public boolean isAccessByRejectApproval(int draNo) {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int empNo = details.getEmpNo();

		Integer rejectByEmpNo = approvalActionMapper.findRejectByEmpNo(empNo, draNo).getEmpNo();
		if (empNo == rejectByEmpNo) {
			return true;
		}
		return false;
	}

	// 결재자 사인이미지 유무
	public int getFindSignByEmpNo() {
		CustomUserDetails details = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		return approvalActionMapper.findSignByEmpNo(details.getEmpNo());
	}

	// 최종 결재자 사인
	public void getUpdateFinalApproval(int draNo, String type) {
		approvalActionMapper.updateFinalApproval(draNo);

		switch (type) {
		case "C02": {
			addBusinessTripSchedule(draNo);
			break;
		}
		case "C04": {
			addVacationSchedule(draNo);
			break;
		}
		default:
			throw new IllegalArgumentException("잘못된 요청입니다.");
		}

	}

	// 출장 일때 일정 추가
	private void addBusinessTripSchedule(int draNo) {
		ResponseBusinessTrip business = approvalActionMapper.findByBusinessTrip(draNo);
		Schedules schedules = new Schedules();
		schedules.setKind("G03");
		schedules.setTitle(business.getTitle());
		schedules.setContent(business.getContent());
		schedules.setStartTime(business.getStartDate());
		schedules.setEndTime(business.getFinishDate());
		saveSchedule(schedules, business.getEmpNo());
	}

	// 휴가 일때 일정 추가
	private void addVacationSchedule(int draNo) {
		ResponseVacation vacation = approvalActionMapper.findByVacation(draNo);
		Schedules schedules = new Schedules();
		schedules.setKind(getVacationScheduleKind(vacation.getKind()));
		schedules.setTitle(vacation.getTitle());
		schedules.setContent(vacation.getContent());
		schedules.setStartTime(vacation.getStartDate());
		schedules.setEndTime(vacation.getFinishDate());
		saveSchedule(schedules, vacation.getEmpNo());
	}
	// 휴가 결재 kind 분기
	private String getVacationScheduleKind(String kind) {
		switch (kind) {
		case "H01":
			return "G02";
		case "H02":
			return "G05";
		default:
			throw new IllegalArgumentException("휴가 승인 실패. 잘못된 요청입니다.");
		}
	}
	// 공통 로직 메서드 묶기
	private void saveSchedule(Schedules schedules, int empNo) {
		int schedule = scheduleMapper.addSchedule(schedules);
		if (schedule == 1) {
			scheduleMapper.addScheduleAttendance(schedules.getSchNo(), empNo);
		}
	}

	// 중간 결재자 사인
	public int getUpdateMidApproval(int draNo) {
		return approvalActionMapper.updateMidApproval(draNo);
	}

}
