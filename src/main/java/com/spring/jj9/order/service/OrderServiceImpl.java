package com.spring.jj9.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay;
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

	@Override
	public int insertPay(Pay pay) {
		return mapper.insertPay(pay);
	}

	@Override
	public Pay getPay(String id) {
		return mapper.getPay(id);
	}

	@Override
	public int getPoint(String id) {
		return mapper.getPoint(id);
	}

	@Override
	public int updatePoint(Member member) {
		return mapper.updatePoint(member);
	}

	@Override
	public String getTalentId(int id) {
		return mapper.getTalentId(id);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		return mapper.updateCoupon(coupon);
	}

	@Override
	public Member getMember(String id) {
		return mapper.getMember(id);
	}

	@Override
	public String getTalnetTitle(int id) {
		return mapper.getTalnetTitle(id);
	}

	@Override
	public int getTalnetCount(int id) {
		return mapper.getTalnetCount(id);
	}

	@Override
	public int updateTalentCount(int plusCount, int talentId) {
		return mapper.updateTalentCount(plusCount, talentId);
	}

}
