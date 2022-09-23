package com.spring.jj9.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.MyPageService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class SecessionController {
	
	@Autowired
	MyPageService service;
	
	@GetMapping("/account/secession")
	public String secession(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/secession";
	}
	
	@ResponseBody
	@PostMapping("/account/user-secession")
	public String userSecession(@RequestParam String password, HttpSession session, Member member) {
		
		log.info("이것은 /account/user-secession 의 password : " + password);
		
		String member_id = session.getAttribute("member_id").toString();
		
		member = service.getMember(member_id);
		member.getMember_password();
		
		// 입력한 비밀번호와 db에 저장된 비밀번호 비교
		if (!member.getMember_password().equals(password)) {
			return "-1";
		}
		
		// 삭제된 행
		Integer row = service.deleteMember(member_id, password);
		
		log.info("delete 가 잘 돌아왔나요...? : " + row);
		
		if (row == 1) {
			session.invalidate(); // session 에서 없앰, 로그아웃 시킴
			return "1"; // delete가 원활하게 됨
		} else {
			return "0"; // delete가 원활하지 않았음
		}
		
	}
}
