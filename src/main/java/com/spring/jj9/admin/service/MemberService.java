package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Member;

public interface MemberService {
	
	
	public Member getMember(String member_id) ;

	public List<Member> getMemberList();

	public void deleteMember(String id);

	public void updateMember(Member member);

}
