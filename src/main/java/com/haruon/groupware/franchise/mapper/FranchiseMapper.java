package com.haruon.groupware.franchise.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.franchise.entity.Franchise;

@Mapper
public interface FranchiseMapper {
	
	List<Franchise> selectFranchiseList();
}
