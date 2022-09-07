package com.spring.jj9.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FindUserController {
	
	@GetMapping("find/user")
	public String findUserPage() {
		return "find/user";
	}
}
