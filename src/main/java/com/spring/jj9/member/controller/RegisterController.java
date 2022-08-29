package com.spring.jj9.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.jj9.member.service.RegisterService;

@Controller
public class RegisterController {
	
	RegisterService service;
	
	@GetMapping("/register")
	public String loginPage() {
		return "register";
	}
	
	@GetMapping("/list")
	public void pizzaListPage(Model model) {
		model.addAttribute("members", service.getMemberList());
	}
	
}
