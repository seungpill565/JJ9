package com.spring.jj9.request.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.dto.Talent_request_all;
import com.spring.jj9.util.Criteria;

public interface RequestHomeMapper {
	
	public List<Category> readCategoryById(int id); // id로 해당 카테고리 불러오기
	
	public List<Category> readAllMainCategorys(); // 메인카테고리들만 불러오기
	
	public List<Category> readCategoryByCate_main(String cate_main); // 메인카테고리 별 서브카테고리들 불러오기
	
	public Integer requestCountByMainCate(String cate_main); // 메인 카테고리 클릭 시 보여지는 재능의뢰 총 개수
	
	public Integer requestCountBySubCate(int id); // 서브 카테고리 클릭 시 보여지는 재능들의 총 개수
	
	public List<Talent_request_all> readRequestAllForPagingByMainCate(@Param("cri")Criteria cri, @Param("cate_main")String cate_main); // 메인 카테고리 클릭시 amount 개수만큼 추려서 가져올 재능
	
	public List<Talent_request_all> readRequestAllForPagingBySubCate(@Param("cri")Criteria cri, @Param("cate_id")int cate_id); // 서브 카테고리 클릭시 amount 개수만큼 추려서 가져올 재능
	
}
