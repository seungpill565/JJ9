package com.spring.jj9.order.service;

import java.util.List;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay;
import com.spring.jj9.dto.TalentAll;

public interface OrderService {
	
	public List<TalentAll> getList(int id);
	public List<Coupon> getCoupon(String id);
	public Coupon getdiscount(int id);
	public int insertPay(Pay pay);
	public Pay getPay(String id);
	public int getPoint(String id);
	public int updatePoint(Member member);
	public String getTalentId(int id);
	public int updateCoupon(Coupon coupon);
	public Member getMember(String id);
	public String getTalnetTitle(int id);
	

}
