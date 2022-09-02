package com.spring.jj9.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.jj9.member.service.LoginService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class LoginController {
	
	LoginService service;
	
	@GetMapping(value = "login")
	public String loginPage() {
		return "login";
	}
	
	@PostMapping(value = "login")
	public String loginProcess(HttpServletRequest request,
			@RequestParam String id, @RequestParam String password) {
		
		log.info("ID: " + id + " PW: " + password);
		
		Integer row = service.login(id, password);
		
		log.info(row);
		
		HttpSession session = request.getSession();
		// 관리자 로그인
		if ("Administrator".equals(id) && "admin".equals(password)) {
			session.setAttribute("login", true);
		} else {
			session.setAttribute("login", false);
		}	
		
		return "redirect:/list";
	}
}
