package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Pay_talentList;

public interface PayService {	
	
	public List<Pay_talentList> getPayList();

	public void refund(int pay_id);			

}