package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Talent_request;

public interface RequestTalentService {
	
	public List<Talent_request> getRequestTalentList();

	public void deleteRequestTalent(int id);

	public void updateRequestTalent(Talent_request talent_request);

	

	

}
