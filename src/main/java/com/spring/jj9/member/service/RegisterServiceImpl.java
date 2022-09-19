package com.spring.jj9.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	public RegisterServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public List<Member> getMemberList() {
		return memberMapper.getList();
	}

	@Override
	public Integer insertMember(Member member) {
		
		int row = memberMapper.insert(member);
		
		return row;
	}

	@Override
	public Integer idCheck(String chk_id) {
		
		Integer cnt = memberMapper.idChecker(chk_id);
		log.info("cnt: " + cnt);
		
		return cnt;			
		
	}


}
