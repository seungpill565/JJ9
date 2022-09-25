package com.spring.jj9.add.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Talent_list;

public interface InsertMapper {
	
	public List<Category> getCategories();
	
	public List<Category> getCateByMain(String cate_main);
	
	public Category getCateIdBySub(String cate_sub);
	
	public Integer insertTalent(Talent_list talent_list);
	
}
