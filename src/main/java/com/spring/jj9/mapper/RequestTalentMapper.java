package com.spring.jj9.mapper;

import java.util.List;


import com.spring.jj9.dto.Talent_request;

public interface RequestTalentMapper {
	
	public List<Talent_request> getRequestTalentList();

	public void deleteRequestTalent(int id);

	
}
