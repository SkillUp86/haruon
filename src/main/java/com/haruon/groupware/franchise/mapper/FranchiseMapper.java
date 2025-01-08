package com.haruon.groupware.franchise.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.franchise.entity.Franchise;

@Mapper
public interface FranchiseMapper {
	
	
	// 가맹점 추가
	Integer insertFranchise(Franchise franchise);
	
	// 가맹점 리스트
	List<Franchise> selectFranchiseList();
	
	// 가맹점 수
	Integer selectFranchisesCount();
}
