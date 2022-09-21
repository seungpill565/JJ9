package com.spring.jj9.member.service;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Member;

public interface MyPageService {

	public Member getMember(String member_id);
	
	public Integer updateMember(
				@Param("name") 		String name, 
				@Param("nickName") 	String nickName, 
				@Param("email") 	String email, 
				@Param("phone") 	String phone, 
				@Param("point") 	String point, 
				@Param("birthday") 	String birthday,
				@Param("member_id") String member_id
			);
	
	public Integer updatePassword(
				@Param("change_password") String change_password, 
				@Param("member_id") String member_id
			);

	public Integer deleteMember(
				@Param("member_id") String member_id, 
				@Param("password") String password
			);
}
