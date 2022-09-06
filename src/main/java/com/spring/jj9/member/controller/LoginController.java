package com.spring.jj9.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.LoginService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class LoginController {
	
	@Inject
	LoginService loginService;
	
	@GetMapping(value = "login")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping("login_check")
	public ModelAndView login_check(@ModelAttribute Member member, 
			HttpSession session, ModelAndView mav) {
		log.info("id " + member.getMember_id() + " pw: " + member.getMember_password());
		
		String member_id = member.getMember_id();
		String member_password = member.getMember_password();
		
		String name = loginService.login(member);
		
		if (name != null) {
			session.setAttribute("member_id", member.getMember_id());
			session.setAttribute("member_name", name);
			mav.setViewName("list");
			mav.addObject("message", "success");
		} else {
			mav.setViewName("login");
			mav.addObject("message", "error");
		}
		
		return mav;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login?message=logout";
	}
}
