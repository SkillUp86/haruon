package com.haruon.groupware.department.service;

import java.util.List;

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

}
