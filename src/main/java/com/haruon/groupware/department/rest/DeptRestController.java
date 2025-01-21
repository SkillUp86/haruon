package com.haruon.groupware.department.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.service.DeptService;

@RestController
public class DeptRestController {
	@Autowired DeptService deptService;
	
	// 부서 활성화
	@PostMapping("/depts/activeYN")
    public ResponseEntity<Map<String, Object>> activeYN(@RequestParam Integer depNo, @RequestParam String activeYn) {
        try {
            Dept dept = new Dept();
            dept.setDepNo(depNo);
            dept.setActiveYn(activeYn);
            deptService.updateDeptActive(dept);
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("activeYn", activeYn);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
