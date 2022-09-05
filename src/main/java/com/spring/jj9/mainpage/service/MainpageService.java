package com.spring.jj9.mainpage.service;

import java.util.List;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;

public interface MainpageService {

	public List<Category> readMainCategory();
	
	public List<TalentAll> readBestPurchase();
	
	public List<TalentAll> readNewPurchase();
}
