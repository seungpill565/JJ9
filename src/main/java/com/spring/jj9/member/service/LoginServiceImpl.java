package com.spring.jj9.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	public LoginServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	@Override
	public String login(Member member) {
		log.info("service 구역 id : " + member.getMember_id() + " service 구역 password " + member.getMember_password());
		return memberMapper.login(member);
	}
	
	

//	@Inject
//	SqlSession sqlSession;
	
//	@Override
//	public String login(Member member) {
//		return sqlSession.selectOne("member.login", member);
//	}
	
}
