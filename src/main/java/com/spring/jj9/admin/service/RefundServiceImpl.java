package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.mapper.RefundMapper;
import com.spring.jj9.dto.Refund_request_pay_talent_list;


@Service
public class RefundServiceImpl implements RefundService{

	@Autowired
	RefundMapper mapper;

	@Override
	public List<Refund_request_pay_talent_list> getRefundList() {
		
		return mapper.getRefundList();
	}

	@Override
	public List<Refund_request_pay_talent_list> getRefundCompletedList() {		
		return mapper.getRefundCompletedList();
	}
	
	@Override
	public void refund(int refund_id) {
		mapper.refund(refund_id);
	}

	
	
	

	

}
