package com.spring.jj9.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.FindUserService;
import com.spring.jj9.member.service.RegisterService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class FindUserController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	FindUserService service;
	
	@Autowired
	public FindUserController(FindUserService service) {
		this.service = service;
	}
	
	
	@GetMapping("find/user")
	public String findUserPage() {
		return "find/user";
	}
	
	@ResponseBody
	@PostMapping(value="find/findId", produces = MediaType.TEXT_PLAIN_VALUE)
	public String findId(@RequestParam String name, @RequestParam String phone) {
		log.info("FindUserController name 발송 여부 " + name);
		log.info("FindUserController phone 발송 여부 " + phone);
		
		String findId = service.findId(name, phone);
		log.info("컨트롤러로 돌아온 findId: " + findId);
		return findId;
	}
	
	// 비밀번호 잃어먹으면 그냥 update 되고, 이메일로 임시번호 전송
	@ResponseBody
	@PostMapping(value="find/updatePw", produces = MediaType.TEXT_PLAIN_VALUE)
	public String findPw(@RequestParam String id, @RequestParam String email) throws Exception {
		log.info("FindUserController id 발송 여부 " + id);
		log.info("FindUserController email 발송 여부 " + email);
		
		return "";
	}
}
