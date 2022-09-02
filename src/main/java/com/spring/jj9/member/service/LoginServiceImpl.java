package com.spring.jj9.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.member.mapper.MemberMapper;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	MemberMapper mapper;

	@Override
	public Integer login(String id, String password) {
		
		return mapper.login(id, password);
	}
	
	

//	@Inject
//	SqlSession sqlSession;
	
//	@Override
//	public String login(Member member) {
//		return sqlSession.selectOne("member.login", member);
//	}
	
}
