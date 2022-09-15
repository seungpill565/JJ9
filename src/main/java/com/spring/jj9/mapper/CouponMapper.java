package com.spring.jj9.mapper;

import java.util.List;

import com.spring.jj9.dto.Coupon;


public interface CouponMapper {

	public List<Coupon> getCouponList();

	public Integer isCodeExist(String random_code);
}
