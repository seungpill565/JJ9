package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Category;
import com.spring.jj9.mapper.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryMapper mapper;

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
	public void deleteCate(int id) {		
		mapper.deleteCateById(id);
	}

}
