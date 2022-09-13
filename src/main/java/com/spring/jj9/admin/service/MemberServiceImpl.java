package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Member;
import com.spring.jj9.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper mapper;
	
	@Override
	public Member getMember(String member_id) {
		return mapper.getMember(member_id);
	}

	@Override
	public List<Member> getMemberList() {		
		return  mapper.getAll();
	}

	@Override
	public void deleteMember(String id) {
		mapper.deleteMemberById(id);
		
	}

	@Override
	public void updateMember(Member member) {
		mapper.updateMember(member);
		
	}

}
