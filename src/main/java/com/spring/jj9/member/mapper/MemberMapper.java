package com.spring.jj9.member.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.jj9.dto.Faq;
import com.spring.jj9.dto.Member;

public interface MemberMapper {
	
	public List<Member> getList();
	
	public Integer insert(Member member);

	public Integer getId(String member_id);
	
	public Integer idChecker(String ID);
	
	public String login(Member member);
	
	public String findId(@Param("name") String name, @Param("phone") String phone);
	
	public String getIdMail(@Param("id") String id, @Param("email") String email);
	
	public Integer updatePw(@Param("id") String id, @Param("ranPassword") String ranPassword);
	
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
				@Param("password")	String password
			);

	public Integer inquire(
				Faq faq, 
				@Param("member_id") String member_id, 
				@Param("inquiry") 	String inquiry
			);

	public Integer inquire(
				@Param("inquiry") 		String inquiry,
				@Param("faq_title") 	String faq_title,
				@Param("faq_content") 	String faq_content, 
				@Param("faq_date") 		Date faq_date, 
				@Param("member_id") 	String member_id 
			);
	
	public List<Faq> getFaqList(String member_id);

	public Faq getMyFaq(
				@Param("faq_id") 	Integer faq_id, 
				@Param("member_id") String member_id
			);
	
}
