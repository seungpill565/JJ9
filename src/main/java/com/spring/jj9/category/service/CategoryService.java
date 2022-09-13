package com.spring.jj9.category.service;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.util.Criteria;

public interface CategoryService {
	
	public List<Category> readCategory(int id);
	
	public List<Category> readAllMainCategory();
	
	public Integer readTalentAllByMainOrSubCount(int id); // 메인 카테고리 클릭 시 보여지는 재능들의 총 개수 / 페이징 시 필요
	
	public List<TalentAll> readTalentAllForPaging(Criteria cri, int id);
	
}
