package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Talent_request;
import com.spring.jj9.mapper.RequestTalentMapper;

@Service
public class RequestTalentServiceImpl implements RequestTalentService{

	@Autowired
	RequestTalentMapper mapper;

	@Override
	public List<Talent_request> getRequestTalentList() {
		return mapper.getRequestTalentList();
	}

	@Override
	public void deleteRequestTalent(int id) {
		mapper.deleteRequestTalent(id);
	}
	
	
	

	

}
