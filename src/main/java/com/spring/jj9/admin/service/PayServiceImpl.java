package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.mapper.PayMapper;

@Service
public class PayServiceImpl implements PayService{

	@Autowired
	PayMapper mapper;

	@Override
	public List<Pay_talentList> getPayList() {
		
		return mapper.getPayList();
	}

}
