package com.spring.jj9.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Talent_list;

public interface TalentMapper {
	
	public List<Talent_list> getUnpermittedTalent();

	public void permissionByTalentId(int id);

	public void deleteTalent(int id);
	
	public List<Talent_list> getTalentList();	

	public void updateTalent(@Param("talent_id")Integer talent_id, @Param("talent_title")String talent_title, @Param("talent_price")Integer talent_price, @Param("talent_date")Date talent_date,
			@Param("talent_service_exp")String talent_service_exp, @Param("talent_curriculum")String talent_curriculum, @Param("talent_workday")Integer talent_workday, @Param("talent_summary")String talent_summary);
}
