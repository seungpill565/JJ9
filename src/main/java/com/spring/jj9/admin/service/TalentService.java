package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Talent_list;

public interface TalentService {
	
	public List<Talent_list> getUnpermittedTalentList();

	public void permissionByTalentId(int id);

	public void deleteTalent(int id);

	public List<Talent_list> getTalentList();

	

}
