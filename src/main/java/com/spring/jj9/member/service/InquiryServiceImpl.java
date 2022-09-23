package com.spring.jj9.member.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Faq;
import com.spring.jj9.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	public InquiryServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public Integer inquire(
			Date date, String inquiry, String title, String content, String member_id) {
		
		return memberMapper.inquire(inquiry, title, content, date, member_id);
	}

	@Override
	public List<Faq> getFaqList(String member_id) {
		
		return memberMapper.getFaqList(member_id);
	}

	@Override
	public Faq getMyFaq(Integer faq_id, String member_id) {
		
		return memberMapper.getMyFaq(faq_id, member_id);
	}


	
}
