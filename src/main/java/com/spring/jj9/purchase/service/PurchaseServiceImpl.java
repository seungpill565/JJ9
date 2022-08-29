package com.spring.jj9.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.purchase.mapper.PurchaseMapper;

public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseMapper mapper;

	@Override
	public List<TalentAll> getList(int id) {
		return mapper.get(id);
	}

}
