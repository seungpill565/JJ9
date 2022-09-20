package com.spring.jj9.buytalent.mapper;

import java.util.List;

import com.spring.jj9.dto.Pay_talentList;

public interface BuyHistoryMapper {
	
	public List<Pay_talentList> getPayTalNull(String member_id);
	
	public List<Pay_talentList> getPayTalRequest(String member_id);
	
	public List<Pay_talentList> getPayTalRefund(String member_id);
}
