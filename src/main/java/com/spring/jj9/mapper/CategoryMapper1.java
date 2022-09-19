package com.spring.jj9.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Category;

public interface CategoryMapper1 {

	public int addCate(Category category);

	public List<Category> getAll();

	public void deleteCateById(int id);		

	public void updateCateById(@Param("pre_id") Integer pre_id, 
			@Param("cate_id") Integer cate_id, 
			@Param("cate_main") String cate_main, 
			@Param("cate_sub") String cate_sub);

}
