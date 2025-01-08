package com.haruon.groupware.category.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.category.entity.Category;


@Mapper
public interface CategoryMapper {
	List<Category> selectCategoryListFree(); 
	List<Category> selectAllCategory();
	
	Integer updateCategory(Category category);
}
