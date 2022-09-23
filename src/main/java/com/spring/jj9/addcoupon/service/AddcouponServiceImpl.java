package com.spring.jj9.addcoupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.addcoupon.mapper.AddCouponMapper;
import com.spring.jj9.dto.Coupon;

@Service
public class AddcouponServiceImpl implements AddCouponService{
	
	@Autowired
	AddCouponMapper mapper;

	@Override
	public List<Coupon> getCouponList(String id) {
		return mapper.getCouponList(id);
	}

	@Override
	public int addCoupon(String id, String code) {
		return mapper.addCoupon(id, code);
	}

	@Override
	public List<Coupon> selectCoupon(String code) {
		return mapper.selectCoupon(code);
	}

}
