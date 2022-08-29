package com.spring.jj9.lsf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LoginController {

	@GetMapping(value = "login")
	public String loginPage() {
		return "login";
	}
	
}
