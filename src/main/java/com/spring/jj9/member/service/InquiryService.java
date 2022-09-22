package com.spring.jj9.member.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Faq;

public interface InquiryService {

	public Integer inquire(
				@Param("date") Date date,
				@Param("inquiry") String inquiry, 
				@Param("title") String title, 
				@Param("content") String content, 
				@Param("member_id") String member_id
			);
	
	public List<Faq> getFaqList(String member_id);
	
	public Faq getMyFaq(
				@Param("faq_id") Integer faq_id, 
				@Param("member_id") String member_id
			);

}
