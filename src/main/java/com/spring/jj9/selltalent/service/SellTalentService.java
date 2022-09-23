package com.spring.jj9.selltalent.service;

import java.util.List;

import com.spring.jj9.dto.PayMember;
import com.spring.jj9.dto.Talent_list;

public interface SellTalentService {
	
	public List<Talent_list> getTalentList(String id);
	public List<PayMember> getMemberInfo(int id);
	public int delTalent(int id);

}
