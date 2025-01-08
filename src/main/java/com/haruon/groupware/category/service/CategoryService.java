package com.haruon.groupware.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.category.entity.Category;
import com.haruon.groupware.category.mapper.CategoryMapper;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	public List<Category> getCategoryListFree(){
		return categoryMapper.selectCategoryListFree();
	}
	
	public List<Category> getAllCategory(){
		return categoryMapper.selectAllCategory();
	}
}
