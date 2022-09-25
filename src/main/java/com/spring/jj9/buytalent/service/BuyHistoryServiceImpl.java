package com.spring.jj9.buytalent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.buytalent.mapper.BuyHistoryMapper;
import com.spring.jj9.dto.Pay_talentList;

@Service
public class BuyHistoryServiceImpl implements BuyHistoryService {
	
	@Autowired
	BuyHistoryMapper mapper;
	
	@Override
	public List<Pay_talentList> getPayTalNull(String member_id) {
		
		return mapper.getPayTalNull(member_id);
	}
	
	@Override
	public List<Pay_talentList> getPayTalRequest(String member_id) {

		return mapper.getPayTalRequest(member_id);
	}
	
	@Override
	public List<Pay_talentList> getPayTalRefund(String member_id) {
		
		return mapper.getPayTalRefund(member_id);
	}
	
	@Override
	public Integer addRefundRequest(int pay_id) {
		
		return mapper.addRefundRequest(pay_id);
	}
	
	@Override
	public Integer updatePayRefundRequest(int pay_id) {

		return mapper.updatePayRefundRequest(pay_id);
	}
	
	@Override
	public Integer deleteRefundRequest(int pay_id) {
		
		return mapper.deleteRefundRequest(pay_id);
	}
	
	@Override
	public Integer updatePayRefundSetNull(int pay_id) {
		
		return mapper.updatePayRefundSetNull(pay_id);
	}
	
	@Override
	public Integer updateBuyFix(int pay_id) {
		
		return mapper.updateBuyFix(pay_id);
	}
}
