package com.spring.jj9.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.mapper.MemberMapper;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	public RegisterServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public List<Member> getMemberList() {
		return memberMapper.getList();
	}


}
