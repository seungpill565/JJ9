package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.mapper.TalentMapper;

@Service
public class TalentServiceImpl implements TalentService{

	@Autowired
	TalentMapper mapper;
	
	
	@Override
	public List<Talent_list> getUnpermittedTalentList() {
		
		return  mapper.getUnpermittedTalent();
	}


	@Override
	public void permissionByTalentId(int id) {
		mapper.permissionByTalentId(id);
	}


	@Override
	public void deleteTalent(int id) {
		mapper.deleteTalent(id);
		
	}


	@Override
	public List<Talent_list> getTalentList() {
		return  mapper.getTalentList();
	}

	

}
