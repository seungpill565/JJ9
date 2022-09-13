package com.spring.jj9.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Member;

public interface MemberMapper {
	
	public List<Member> getList();
	
	public Integer insert(Member member);

	public Integer getId(String member_id);
	
	public Integer idChecker(String ID);
	
	public String login(Member member);
	
	public String findId(@Param("name") String name, @Param("phone") String phone);
	
	public String updatePw(String id, String email);
}
