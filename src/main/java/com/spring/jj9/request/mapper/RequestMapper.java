package com.spring.jj9.request.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Talent_request;
import com.spring.jj9.dto.Talent_request_all;

public interface RequestMapper {
	
	public List<Category> getMainCategories();
	
	public List<Category> getSubCateByMain(String cate_main);
	
	public List<Talent_request> getRequestList();
	
	public Integer insertRequest(Talent_request tr);
	
	public Talent_request_all getRequestAllById(int trequest_id);
}
