package com.spring.jj9.mainpage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Category;
import com.spring.jj9.mainpage.mapper.MainpageMapper;

@Service
public class MainpageServiceImpl implements MainpageService{

	@Autowired
	MainpageMapper mapper;
	
	@Override
	public List<Category> readMainCategory() { // 메인에 표시할 메인카테고리만 read

		return mapper.readMainCate();
	}

}
