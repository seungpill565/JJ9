package com.spring.jj9.mapper;

import java.util.List;

import com.spring.jj9.dto.Talent_list;

public interface TalentMapper {
	
	public List<Talent_list> getUnpermittedTalent();

	public void permissionByTalentId(int id);

	public void deleteTalent(int id);
	
	public List<Talent_list> getTalentList();
}
