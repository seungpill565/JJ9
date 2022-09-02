package com.spring.jj9.order.service;

import java.util.List;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.TalentAll;

public interface OrderService {
	
	public List<TalentAll> getList(int id);
	public List<Coupon> getCoupon(String id);
	public Coupon getdiscount(int id);

}
