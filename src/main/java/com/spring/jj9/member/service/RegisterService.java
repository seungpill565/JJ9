package com.spring.jj9.member.service;

import java.util.List;

import com.spring.jj9.dto.Member;

public interface RegisterService {
	
	public List<Member> getMemberList();
	
	public Integer insertMember(Member member);
	
}
