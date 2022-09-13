package com.spring.jj9.mapper;

import java.util.List;

import com.spring.jj9.dto.Refund_request_pay_talent_list;

public interface RefundMapper {	

	public List<Refund_request_pay_talent_list> getRefundList();

	public List<Refund_request_pay_talent_list> getRefundCompletedList();
	
	public void refund(int refund_id);


}
