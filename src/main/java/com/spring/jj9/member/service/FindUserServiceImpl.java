package com.spring.jj9.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class FindUserServiceImpl implements FindUserService {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	public FindUserServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public String findId(String name, String phone) {
		log.info("service-name 왔는지 확인: " + name);
		log.info("service-phone 왔는지 확인: " + phone);
		String id = memberMapper.findId(name, phone);
		log.info("service 의 id는? " + id);
		return id;
	}

	@Override
	public String getId(String id, String email) {
		
		log.info("service-id : " + id + ", service-email : " + email);
		
		String nid = memberMapper.getIdMail(id, email);
		log.info("nid가 잘 돌아왔는지 확인" + nid);
		
		return nid;
	}
	
	@Override
	public Integer updatePw(String id, String ranPassword) {
		
		log.info("update 문의 log 확인 service-nid : " + id + " ranPassword : " + ranPassword);
		
		Integer nPassword = memberMapper.updatePw(id, ranPassword);
		log.info("nPassword가 잘 돌아왔는지 확인 " + memberMapper.updatePw(id, ranPassword));
		
		return nPassword;
	}

	
}
