package com.spring.jj9.member.service;

import java.sql.Date;

import org.apache.ibatis.annotations.Param;

public interface InquiryService {

	public Integer inquire(
				@Param("date") Date date,
				@Param("inquiry") String inquiry, 
				@Param("title") String title, 
				@Param("content") String content, 
				@Param("member_id") String member_id
			);

}
