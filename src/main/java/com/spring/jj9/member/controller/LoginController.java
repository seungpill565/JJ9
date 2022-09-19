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
		
		String name = loginService.login(member);
		
		if (name != null) {
			session.setAttribute("member_id", member.getMember_id());
			session.setAttribute("member_name", name);
			
			/*
			  제 설계 실수로 model and view 를 만들어서 쓸모없는 justMove 페이지를 만들었습니다^^... 
			  ModelAndView 는 주소가 이동하지 않고 화면에 보이는 페이지만 이동합니다. 
			  이 문제를 해결하기 위해 justMove 페이지를 만들었습니다.
			  
			  justMove 페이지는 main 페이지로 바로 이동하게 만드는 페이지이기 때문에 이건 무시하셔도 됩니다.
			*/
			mav.setViewName("justMove");
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
