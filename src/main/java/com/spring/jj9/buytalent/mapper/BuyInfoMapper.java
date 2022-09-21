package com.spring.jj9.buytalent.mapper;

import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.dto.Review;

public interface BuyInfoMapper {
	
	public Pay_talentList getPayTal(int pay_id);
	
	public Member getMember(String member_id);
	
	public Integer addReview(Review review);
}
