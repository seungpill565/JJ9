package com.spring.jj9.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;

public interface CategoryMapper {

	public int addCate(Category category);

	public List<Category> getAll();

	public void deleteCateById(int id);

}
