package com.haruon.groupware.meetingroom.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication; // 올바른 Authentication 클래스 import
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.meetingroom.service.ReservationService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class ReservationRestController {

    @Autowired ApprovalService approvalService;
    @Autowired ReservationService reservationService;

    @GetMapping("/reservation/depts/{deptNo}/employees")
    public ResponseEntity<List<ResponseEmployee>> getEmployeeListByDept(@PathVariable int deptNo, Authentication authentication) {
        // 로그인한 사용자 정보 가져오기
        CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
        int empNo = details.getEmpNo();
        
        // 해당 부서의 직원 목록을 가져오기
        List<ResponseEmployee> empList = approvalService.findEmpByDept(deptNo, empNo);
        
        return ResponseEntity.ok(empList);
    }
    
    @GetMapping("/addReservation/{meeNo}/times")
    public ResponseEntity<List<CommonCode>> getAvailableTimes(
            @PathVariable("meeNo") int meeNo,
            @RequestParam("revDate") String revDate) {
        List<CommonCode> availableTimes = reservationService.ReservationTime(meeNo, revDate);
        log.debug(availableTimes.toString());
        return ResponseEntity.ok(availableTimes);
    }
    
    @GetMapping("/reservation/depts/{deptNo}/employee")
    public ResponseEntity<List<ResponseEmployee>> findEmpDept(@PathVariable int deptNo, Authentication authentication) {
        // 로그인한 사용자 정보 가져오기
        CustomUserDetails details = (CustomUserDetails) authentication.getPrincipal();
        int empNo = details.getEmpNo();
        
        // 해당 부서의 직원 목록을 가져오기
        List<ResponseEmployee> empList = reservationService.findEmpDept(deptNo, empNo);
        
        return ResponseEntity.ok(empList);
    }
}
