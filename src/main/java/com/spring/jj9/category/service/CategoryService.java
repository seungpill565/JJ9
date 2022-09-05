package com.spring.jj9.category.service;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.util.Criteria;

public interface CategoryService {
	
	public List<Category> readMainCategory(int id);
	
	public List<TalentAll> readTalentAllByCate_main(int id);
	
	public List<Category> readAllMainCategory();
	
	public List<TalentAll> readTalentAllByRownum(Criteria cri); // 페이징
	
	public Integer readTotalTalent();
	
}
