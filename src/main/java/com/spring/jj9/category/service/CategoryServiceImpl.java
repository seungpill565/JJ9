package com.spring.jj9.category.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.category.mapper.CategoryMapper;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryMapper mapper;
		
	@Override
	public List<Category> readCategory(int id) {
		List<Category> list = new ArrayList<>();
		list = mapper.readAll();
		
		return mapper.readAll();
	}
	
	

	@Override
	public List<TalentAll> readTalentById(int id) {
		
		return mapper.readTalentByID(id);
	}



	@Override
	public List<Category> readMainCategory(int id) {
		//List<Category> list = new ArrayList<>();// 특정 id의 메인 카테고리
		//List<Category> mainLists = new ArrayList<>(); // 메인 값만 있는 데이터들
		
		//mainLists = mapper.readAllMainCategory(); 
		//System.out.println(mainLists.size());

		String cate_main = mapper.readMainCategoryById(id).get(0).getCate_main(); // 접속한 id로 뽑아낸 메인카테고리
		
		
//		if(id<10) {
//			return mapper.readCategoryByCate_main(cate_main);		
//		}else
//			return mapper.readTalentAllByCate_id(id);
//		
		
//		System.out.println("카테 메인 "+cate_main+" 타입 : "+cate_main.getClass().getName());
		return mapper.readCategoryByCate_main(cate_main);
		
	}



	@Override
	public List<TalentAll> readTalentAllByCate_main(int id) {
		
		String cate_main = mapper.readMainCategoryById(id).get(0).getCate_main(); // 접속한 id의 메인카테고리
		
		
		return mapper.readTalentAllByCate_main(cate_main); // 접속한 id의 메인 카테고리에 적은 모든 재능 관련 정보
	}



	@Override
	public List<TalentAll> readTalentAllByCate_id(int id) {
		
		//String cate_sub = 
		
		return null;
	}
	
	
	
}
