package com.spring.jj9.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.order.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper mapper;
	
	@Override
	public List<TalentAll> getList(int id) {
		return mapper.get(id);
	}

	@Override
	public List<Coupon> getCoupon(String id) {
		return mapper.getCoupon(id);
	}

	@Override
	public Coupon getdiscount(int id) {
		return mapper.getdiscount(id);
	}

}
