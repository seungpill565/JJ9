package com.spring.jj9.member.service;

import org.apache.ibatis.annotations.Param;

public interface FindUserService {
	
	public String findId(@Param("name") String name, @Param("phone") String phone);
	
	public String updatePw(String id, String email);
}
