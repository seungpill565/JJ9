package com.spring.jj9.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Faq;

public interface FaqMapper {

	public List<Faq> getFaqList();

	public List<Faq> getAnsweredFaqList();

	public void answerFaq(@Param("faq_id") Integer faq_id, @Param("faq_answer") String faq_answer);
	
}
