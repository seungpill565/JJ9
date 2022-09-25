package com.spring.jj9.selltalent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.PayMember;
import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.selltalent.mapper.SellTalentMapper;

@Service
public class SellTalentServiceImpl implements SellTalentService{
	
	@Autowired
	SellTalentMapper mapper;
	

	@Override
	public List<Talent_list> getTalentList(String id) {
		return mapper.getTalentList(id);
	}


	@Override
	public List<PayMember> getMemberInfo(int id) {
		return mapper.getMemberInfo(id);
	}


	@Override
	public int delTalent(int id) {
		
		return mapper.delTalent(id);
	}

}
