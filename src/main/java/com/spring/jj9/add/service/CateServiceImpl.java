package com.spring.jj9.add.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.add.mapper.InsertMapper;

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
	
	@Override
	public Integer getCateIdBySub(String cate_sub) {
		
		return insertMapper.getCateIdBySub(cate_sub).getCate_id();
	}
	
	@Override
	public Integer insertTalent(Talent_list talent_list) {
		
		return insertMapper.insertTalent(talent_list);
	}

}
