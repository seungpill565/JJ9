package com.spring.jj9.purchase.mapper;


import java.util.List;

import com.spring.jj9.dto.TalentAll;

public interface PurchaseMapper {
	
	public List<TalentAll> get(int pk);
	public List<TalentAll> getreview(int pk);
	public List<TalentAll> getgardelist(int pk);
}
