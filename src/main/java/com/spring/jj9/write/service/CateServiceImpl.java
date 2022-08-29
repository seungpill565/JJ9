package com.spring.jj9.write.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Category;
import com.spring.jj9.write.mapper.InsertMapper;

@Service
public class CateServiceImpl implements CateService {
	
	@Autowired
	InsertMapper insertMapper;
	
	@Override
	public List<Category> getCategories() {
		
		return insertMapper.getCategories();
	}
	
	@Override
	public List<Category> getCateByMain(String cate_main) {
		
		return insertMapper.getCateByMain(cate_main);
	}

}
