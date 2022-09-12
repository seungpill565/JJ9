package com.spring.jj9.category.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.category.mapper.CategoryMapper;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.util.Criteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryMapper mapper;
	
	private Integer checkCate=0; // id가 메인일때 0 / id가 서브일때 1

	@Override
	public List<Category> readCategory(int id) { // 메인페이지에서 처음 메인카테고리를 클릭 시 실행되는 메서드
		String cateById = mapper.readCategoryById(id).get(0).getCate_main(); // 접속한 id로 뽑아낸 메인카테고리 / 서브카테고리 표시하려고 쓰는 변수
		
		
		if(id<10) { // 메인 클릭시 id가 10 이하이므로 
			checkCate=0;
		}else{		// 서브 클릭시 id가 10 이상
			checkCate=1;
		}
		
		return mapper.readCategoryByCate_main(cateById); // 메인페이지에서 메인카테고리 클릭시 해당 메인카테고리 하위 서브카테고리 리스트를 리턴
	}


	@Override
	public List<Category> readAllMainCategory() { // 모든 메인카테고리들 리턴
		return mapper.readAllMainCategorys();
	}

	@Override
	public List<TalentAll> readTalentAllForPaging(Criteria cri, int cate_id) { // 메인이나 서브를 누르면 해당 카테고리의 전체 재능 중 amount 개수만큼 리턴 /페이징 시 필요
		
		String cate_main = mapper.readCategoryById(cate_id).get(0).getCate_main(); // 가져온 id에 해당하는 메인카테고리 이름
		
		System.out.println("id : " + cate_id + " cate_main : " + cate_main);
		
		if(checkCate ==0) {
			return mapper.readTalentAllForPagingByMainCate(cri, cate_main);
		}else {
			return mapper.readTalentAllForPagingBySubCate(cri, cate_id);
		}
		
	}

	@Override
	public Integer readTalentAllByMainOrSubCount(int id) { // 메인카테고리 눌렀을때 나오는 재능들의 총 개수

		String cate = mapper.readCategoryById(id).get(0).getCate_main();
		
		if(checkCate==0) {
			return mapper.readTalentCountByMainCate(cate); // 메인 카테고리 클릭 시 메인카테고리의 재능 총 개수 리턴
		}else { 
			return mapper.readTalentCountBySubCate(id); // 서브 카테고리 클릭 시 서브카테고리의 재능 총 개수 리턴
		}
	}





}
