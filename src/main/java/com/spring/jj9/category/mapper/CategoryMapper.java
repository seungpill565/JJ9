package com.spring.jj9.category.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;

public interface CategoryMapper {

	public List<Category> readAll();
	
	public List<TalentAll> readTalentByID(int id);
}
