package com.haruon.groupware.franchise.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.franchise.entity.Franchise;
import com.haruon.groupware.franchise.mapper.FranchiseMapper;

@Service
@Transactional
public class FranchiseService {
	@Autowired FranchiseMapper franchiseMapper;
	
	
	// 가맹점 추가
	public Integer addFranchise(Franchise franchise) {
		return franchiseMapper.insertFranchise(franchise);
	}
	
	// 가맹점 조회
	public List<Franchise> getFranchiseList() {
		return franchiseMapper.selectFranchiseList();
	}

}
