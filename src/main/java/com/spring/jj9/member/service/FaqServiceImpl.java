package com.spring.jj9.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.member.mapper.MemberMapper;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	public FaqServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
}
