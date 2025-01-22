package com.haruon.groupware.department.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.department.entity.Dept;
import com.haruon.groupware.department.mapper.DeptMapper;

@Service
@Transactional
public class DeptService {
	
	private final DeptMapper deptMapper;
	
	public DeptService(DeptMapper deptMapper) {
		this.deptMapper = deptMapper; 
	}
	
	public List<Dept> findByAll() {
		return deptMapper.findByAll();
	}
	
	// 부서 + 부서장
	public List<Map<String,Object>> getDeptHead(){
		Map<String,Object> map = new HashMap<>();
		List<Map<String,Object>> deptList = deptMapper.selectDeptHead(map);
		return deptList;
	}
	
	// 모든 부서 리스트
	public List<Dept> getDeptList() {
		return deptMapper.selectDeptList();
	}
	
	// 부서 등록
	public Integer insertDept(Dept dept) {
		return deptMapper.insertDept(dept);
	}
	
	// 부서 수정
	public Integer updateDept(Dept dept) {
		return deptMapper.updateDept(dept);
	}
	
	// 부서 활성화/비활성화
	public Integer updateDeptActive(Dept dept) {
		return deptMapper.updateDeptActive(dept);
	}
}
