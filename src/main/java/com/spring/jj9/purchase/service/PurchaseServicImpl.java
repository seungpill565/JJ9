package com.spring.jj9.purchase.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.purchase.mapper.PurchaseMapper;

public class PurchaseServicImpl implements PurchaseServic{
	
	@Autowired
	PurchaseMapper mapper;

	@Override
	public Talent_list getList(int id) {
		return mapper.get(id);
	}

}
