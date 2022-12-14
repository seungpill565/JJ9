package com.spring.jj9.mainpage.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;

public interface MainpageMapper {

	public List<Category> readMainCate();
	
	public List<Category> readAllSubCategorys(); // 서브카테고리들만 불러오기
	
	public List<TalentAll> readBestPurchase();
	
	public List<TalentAll> readNewPurchase();
}
