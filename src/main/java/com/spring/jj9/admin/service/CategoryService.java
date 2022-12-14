package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Category;

public interface CategoryService {
	
	
	public Integer addCate(Category category) ;
	
	public List<Category> getCateList();

	public void deleteCate(int id);

	public void updateCate(Integer pre_id, Category new_category);	
	
	public List<Category> getCateListBy11();

}
