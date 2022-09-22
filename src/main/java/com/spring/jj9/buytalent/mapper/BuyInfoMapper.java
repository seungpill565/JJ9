package com.spring.jj9.buytalent.mapper;

import java.util.List;

import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.dto.Review;

public interface BuyInfoMapper {
	
	public Pay_talentList getPayTal(int pay_id);
	
	public Member getMember(String member_id);
	
	public Integer addReview(Review review);
	
	public Review reviewIsExist(int pay_id);
	
	public Integer updateReview(Review reivew);
	
	public Review getReview(int review_id);
	
	public Integer deleteReview(int review_id);
}
