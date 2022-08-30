package com.spring.jj9.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.RegisterService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class RegisterController {
	
	RegisterService service;
	
	@Autowired
	public RegisterController(RegisterService service) {
		this.service = service;
	}
	
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}
	
	@GetMapping("/list")
	public void memberListPage(Model model) {
		model.addAttribute("members", service.getMemberList());
	}
	
	@PostMapping("/register")
	public String registerMember(Member member, HttpServletResponse response) throws IOException {
		
		String member_id = member.getMember_id();
		String member_password = member.getMember_password();
		String member_rePassword = member.getMember_rePassword();
		log.info("적은 아이디가 오는지 확인 " + member_id);
		log.info("비밀번호와 비밀번호 재확인 " + member_password);
		log.info("재확인 " + member_rePassword);
		if (
				member_id == null || member_id.equals("") ||
				member_password == null || member_password.equals("") ||
				member_rePassword == null || member_rePassword.equals("")
		) {
			return "redirect:/register";
		} else if (!member_password.equals(member_rePassword)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 재확인 비밀번호와 틀립니다. 다시 입력해주세요'); </script>");
			out.flush();
			member_id = null;
			return "register"; 
			// 여기서 redirect 걸면 alert 기능 추가 때문인지 화면이 안넘어가지고, forward로 넘겨야 넘어가짐
		}
		
		return "redirect:/list";
	}
	
}
