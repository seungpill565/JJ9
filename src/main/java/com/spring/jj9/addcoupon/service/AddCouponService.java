package com.spring.jj9.addcoupon.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Coupon;

public interface AddCouponService {
	public List<Coupon> getCouponList(String id);
	public int addCoupon (@Param("member_id")String id, @Param("code")String code);
	public List<Coupon> selectCoupon(String code);

}
