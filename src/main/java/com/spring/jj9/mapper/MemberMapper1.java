package com.spring.jj9.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Member;

public interface MemberMapper1 {

	public Member getMember(String member_id);

	public List<Member> getAll();

	public void deleteMemberById(String id);

	public void updateMember(Member member);
	
	public void updatePoint(@Param("member_id")String member_id, @Param("point") Integer point);
}
