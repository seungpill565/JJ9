package com.spring.jj9.write.service;

import java.util.List;

import com.spring.jj9.dto.Category;

public interface CateService {
	
	public List<Category> getCategories();
	
	public List<Category> getCateByMain(String cate_main);
}
