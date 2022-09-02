package com.spring.jj9.order.mapper;

import java.util.List;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.TalentAll;

public interface OrderMapper {
	
	public List<TalentAll> get(int pk);
	public List<Coupon> getCoupon(String id);
	public Coupon getdiscount(int id);

}
