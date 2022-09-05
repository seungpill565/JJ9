package com.spring.jj9.category.mapper;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.util.Criteria;

public interface CategoryMapper {
	
	public List<Category> readMainCategoryById(int id); // id로 해당 카테고리 불러오기
	
	public List<Category> readAllMainCategorys(); // 메인카테고리들만 불러오기
	
	public List<Category> readCategoryByCate_main(String cate_main); // 메인카테고리 별 서브카테고리들 불러오기
	
	public List<TalentAll> readTalentAllByCate_main(String cate_main); // 메인 카테고리 클릭 시 보여지는 재능
	
	public List<TalentAll> readTalentAllByCate_id(int id); // 서브 카테고리 클릭 시 보여지는 재능 리턴
	
	public List<TalentAll> readTalentAllByRownum(Criteria cri); // 페이징
	
	public Integer readTotalTalent();
	
}
