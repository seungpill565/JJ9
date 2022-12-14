package com.spring.jj9.buytalent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.buytalent.mapper.BuyInfoMapper;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.dto.Review;

@Service
public class BuyInfoServiceImpl implements BuyInfoService {
	
	@Autowired
	BuyInfoMapper buyInfoMapper;
	
	@Override
	public Pay_talentList getPayTal(int pay_id) {
		
		return buyInfoMapper.getPayTal(pay_id);
	}
	
	@Override
	public Member getMember(String member_id) {
		
		return buyInfoMapper.getMember(member_id);
	}
	
	@Override
	public Integer addReview(Review review) {
		
		return buyInfoMapper.addReview(review);
	}
	
	@Override
	public Review reviewIsExist(int pay_id) {
		
		return buyInfoMapper.reviewIsExist(pay_id);
	}
	
	@Override
	public Integer updateReview(Review review) {
		
		return buyInfoMapper.updateReview(review);
	}
	
	@Override
	public Review getReview(int review_id) {
		
		return buyInfoMapper.getReview(review_id);
	}
	
	@Override
	public Integer deleteReview(int review_id) {
		
		return buyInfoMapper.deleteReview(review_id);
	}
}
