package com.haruon.groupware.department.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.department.entity.Dept;

@Mapper
public interface DeptMapper {
	
	public List<Dept> findByAll();
}
