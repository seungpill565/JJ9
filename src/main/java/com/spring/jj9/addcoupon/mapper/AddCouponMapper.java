package com.spring.jj9.addcoupon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Coupon;

public interface AddCouponMapper {
	public List<Coupon> getCouponList(String id);
	public int addCoupon (@Param("id")String id, @Param("code")String code);
	public List<Coupon> selectCoupon(String code);

}
