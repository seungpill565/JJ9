package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Category;
import com.spring.jj9.mapper.CategoryMapper1;

@Service
public class CategoryServiceImpl1 implements CategoryService{

	@Autowired
	CategoryMapper1 mapper;

	@Override
	public Integer addCate(Category category) {
		int row = mapper.addCate(category);
		return 1;
	}

	@Override
	public List<Category> getCateList() {
		
		return  mapper.getAll();
	}

	@Override
	public List<Category> getCateListBy11() {
	
		return mapper.getCateListBy11();
	}
	
	@Override
	public void deleteCate(int id) {		
		mapper.deleteCateById(id);
	}

	

	@Override
	public void updateCate(Integer pre_id, Category new_category) {
		
		mapper.updateCateById(pre_id, new_category.getCate_id(), new_category.getCate_main(), new_category.getCate_sub());
		
	}


}
