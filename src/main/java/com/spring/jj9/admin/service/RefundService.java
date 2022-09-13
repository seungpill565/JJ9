package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Refund_request_pay_talent_list;

public interface RefundService {	
	
	public List<Refund_request_pay_talent_list> getRefundList();

	public List<Refund_request_pay_talent_list> getRefundCompletedList();
	
	public void refund(int refund_id);


}
