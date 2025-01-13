package com.haruon.groupware.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.board.mapper.BoardMapper;
import com.haruon.groupware.category.entity.Category;
import com.haruon.groupware.category.mapper.CategoryMapper;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	@Autowired BoardMapper boardMapper;
	
	// 자유 게시판 카테고리
	public List<Category> getCategoryListFree(){
		return categoryMapper.selectCategoryListFree();
	}
	
	// 모든 카테고리
	public List<Category> getAllCategory(){
		return categoryMapper.selectAllCategory();
	}
	
	// 카테고리 등록
	public Integer insertCategory(Category category) {
		return categoryMapper.insertCategory(category);
	}
	
	// 카테고리 수정
	public Integer updateCategory(Category category) {
	    return categoryMapper.updateCategory(category);
	}
	
	// 카테고리 삭제
	public void deleteCategory(Integer catNo) {
		try {
	        categoryMapper.deleteCategory(catNo);
	    } catch (DataIntegrityViolationException e) {
	    	// 해당 카테고리에 글이 있으면 그 글의 카테고리를 기타(cat_no=100)로 변경
	    	boardMapper.updateCatNo(catNo, 100); // board 테이블 업데이트
            categoryMapper.deleteCategory(catNo); // 다시 카테고리 삭제
	    }
	}
	
	
}
