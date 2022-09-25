package com.spring.jj9.buytalent.service;

import java.util.List;

import com.spring.jj9.dto.Pay_talentList;

public interface BuyHistoryService {
	
	public List<Pay_talentList> getPayTalNull(String member_id);
	
	public List<Pay_talentList> getPayTalRequest(String member_id);
	
	public List<Pay_talentList> getPayTalRefund(String member_id);
	
	public Integer addRefundRequest(int pay_id);
	
	public Integer updatePayRefundRequest(int pay_id);
	
	public Integer deleteRefundRequest(int pay_id);
	
	public Integer updatePayRefundSetNull(int pay_id);
	
	public Integer updateBuyFix(int pay_id);
}
