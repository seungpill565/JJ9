package com.spring.jj9.request.service;

import java.util.List;

import com.spring.jj9.dto.Category;

public interface RequestService {
	
	public List<Category> getMainCategories();
	
	public List<Category> getSubCateByMain(String cate_main);
}
