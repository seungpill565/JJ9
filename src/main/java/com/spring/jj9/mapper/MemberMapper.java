package com.spring.jj9.mapper;

import java.util.List;

import com.spring.jj9.dto.Member;

public interface MemberMapper {

	public Member getMember(String member_id);

	public List<Member> getAll();

	public void deleteMemberById(String id);

	public void updateMember(Member member);
}
