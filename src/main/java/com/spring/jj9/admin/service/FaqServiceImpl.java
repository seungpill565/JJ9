package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Faq;
import com.spring.jj9.mapper.FaqMapper;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	FaqMapper mapper;

	@Override
	public List<Faq> getFaqList() {
		return mapper.getFaqList();
	}

	@Override
	public List<Faq> getAnsweredFaqList() {		
		return mapper.getAnsweredFaqList();
	}

	@Override
	public void answerFaq(Integer faq_id, String faq_answer) {
		 mapper.answerFaq(faq_id, faq_answer);		
	}


	


}
