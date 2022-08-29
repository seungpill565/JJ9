package com.spring.jj9.purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.purchase.mapper.PurchaseMapper;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseMapper mapper;

	@Override
	public TalentAll getList(int id) {
		return mapper.get(id);
	}

}
