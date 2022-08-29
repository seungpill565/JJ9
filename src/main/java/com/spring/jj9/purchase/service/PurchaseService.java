package com.spring.jj9.purchase.service;

import java.util.List;

import com.spring.jj9.dto.TalentAll;


public interface PurchaseService {
	
	public List<TalentAll> getList(int id);
	public List<TalentAll> getReviewList(int id);
	public double getSumReviewGrade(int id);
	public int getCountGrade(int id);

}
