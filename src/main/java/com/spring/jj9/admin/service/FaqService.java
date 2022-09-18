package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Faq;

public interface FaqService {	
	
	public List<Faq> getFaqList();	
	
	public List<Faq> getAnsweredFaqList();

	public void answerFaq(Integer faq_id, String faq_answer);

}
