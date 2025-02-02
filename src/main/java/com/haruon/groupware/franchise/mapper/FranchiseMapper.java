package com.haruon.groupware.franchise.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.franchise.entity.Franchise;

@Mapper
public interface FranchiseMapper {
	
	// 가맹점 수정
	Integer modifyFranchise(Franchise franchise);
	
	// 가맹점 정보 조회
	Franchise selectFranchise(Integer fraNo);
	
	// 가맹점 등록
	Integer insertFranchise(Franchise franchise);
	
	// 가맹점 리스트
	List<Franchise> selectFranchiseInfo(Franchise franchise);
}
