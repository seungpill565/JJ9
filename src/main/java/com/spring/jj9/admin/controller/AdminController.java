package com.spring.jj9.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.jj9.admin.service.MemberService;
import com.spring.jj9.dto.Member;


@Controller
public class AdminController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("/admin")
	public String goToAdmin(Model model , HttpSession session) {
		System.out.println("접속완료");
		System.out.println(memberService.getMember("admin1"));
		
		Member currUser= memberService.getMember("admin1");
		
		session.setAttribute("currUser", currUser);		
			
		
		return "/admin/adminMain";
	}
	@GetMapping("/addCateForm")
	public String addCateForm() {
		return "admin/addCateForm"; 
	}
}
