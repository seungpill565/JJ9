package com.spring.jj9.write.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;

public interface InsertMapper {
	
	public List<Category> getCategories();
	
	public List<Category> getCateByMain(String cate_main);
	
}
