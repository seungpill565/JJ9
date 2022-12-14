package com.spring.jj9.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.mapper.MemberMapper;

@Service
public class MyPageServiceImpl implements MyPageService {

	MemberMapper memberMapper;
	
	@Autowired
	public MyPageServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public Member getMember(String member_id) {
		return memberMapper.getMember(member_id);
	}

	@Override
	public Integer updateMember(String name, String nickName, String email, 
			String phone, String point, String birthday, String member_id) {
		return memberMapper.updateMember(name, nickName, email, phone, point, birthday, member_id);
	}

	@Override
	public Integer updatePassword(String change_password, String member_id) {
		return memberMapper.updatePassword(change_password, member_id);
	}

	@Override
	public Integer deleteMember(String member_id, String password) {
		return memberMapper.deleteMember(member_id, password);
	}




	
}
