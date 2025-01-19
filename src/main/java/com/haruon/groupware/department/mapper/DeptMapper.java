package com.haruon.groupware.department.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.department.entity.Dept;

@Mapper
public interface DeptMapper {
	
	public List<Dept> findByAll();
	
	List<Map<String,Object>> selectDeptHead(Map<String,Object> map);
	
	List<Dept> selectDeptList(); 
	
	Integer insertDept(Dept dept);
	
	Integer updateDept(Dept dept);
	
	Integer updateDeptActive(Dept dept);
}
