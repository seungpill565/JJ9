package com.spring.jj9.member.service;

import org.springframework.stereotype.Service;

import com.spring.jj9.member.mapper.MemberMapper;

@Service
public class LoginServiceImpl implements LoginService {

	MemberMapper mapper;

	@Override
	public String login(String id, String password) {
		
		return null;
	}
	
	

//	@Inject
//	SqlSession sqlSession;
	
//	@Override
//	public String login(Member member) {
//		return sqlSession.selectOne("member.login", member);
//	}
	
}
