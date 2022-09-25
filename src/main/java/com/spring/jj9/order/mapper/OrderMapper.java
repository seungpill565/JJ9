package com.spring.jj9.order.mapper;

import java.util.List;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay;
import com.spring.jj9.dto.TalentAll;

public interface OrderMapper {
	
	public List<TalentAll> get(int pk);
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
