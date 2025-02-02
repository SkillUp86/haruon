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
	
	// 가맹점 리스트
	public List<Franchise> getFranchiseList() {
		return franchiseMapper.selectFranchiseInfo(new Franchise());
	}
	
	// 가맹점 정보 조회
	public Franchise getFranchise(Integer fraNo) {
		Franchise franchise = new Franchise();
		franchise.setFraNo(fraNo);
		return franchiseMapper.selectFranchiseInfo(franchise).get(0);
	}
	// 가맹점 수정
	public Integer modifyFranchise(Franchise franchise) {
		return franchiseMapper.modifyFranchise(franchise);
	}
	
	// 가맹점 추가
	public Integer addFranchise(Franchise franchise) {
		return franchiseMapper.insertFranchise(franchise);
	}
	

}
