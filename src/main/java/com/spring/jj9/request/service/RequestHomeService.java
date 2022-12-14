package com.spring.jj9.request.service;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Talent_request_all;
import com.spring.jj9.util.Criteria;

public interface RequestHomeService {
	
	public List<Category> readCategory(int id);
	
	public List<Category> readAllMainCategory();
	
	public Integer readRequestAllByMainOrSubCount(int id); // 메인 카테고리 클릭 시 보여지는 재능들의 총 개수 / 페이징 시 필요
	
	public List<Talent_request_all> readRequestAllForPaging(Criteria cri, int id);
	
}
