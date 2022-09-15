package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Coupon;

public interface CouponService {
	
	public List<Coupon> getCouponList();

	public boolean isCodeAvailable(String random_code);

}
