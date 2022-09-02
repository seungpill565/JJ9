package com.spring.jj9.purchase.mapper;


import java.util.List;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.TalentAll;

public interface PurchaseMapper {
	
	public List<TalentAll> get(int pk);
	public List<TalentAll> getreview(int pk); // 총리뷰의 점수를 확인하는 매퍼
	public List<TalentAll> getgardelist(int pk);//리뷰를 몇명 남겼는지 확인하는 매퍼
	
	
}
