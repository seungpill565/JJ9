package com.spring.jj9.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.category.mapper.CategoryMapper;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryMapper mapper;
		
	@Override
	public List<Category> readCategory() {

		return mapper.readAll();
	}

	@Override
	public List<TalentAll> readTalentById(int id) {
		
		return mapper.readTalentByID(id);
	}
}
