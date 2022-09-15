package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.mapper.CouponMapper;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	CouponMapper mapper;

	@Override
	public List<Coupon> getCouponList() {
		
		return mapper.getCouponList();
	}

	@Override
	public boolean isCodeAvailable(String random_code) {		
		
		return mapper.isCodeExist(random_code) == null;
	}

	

}
