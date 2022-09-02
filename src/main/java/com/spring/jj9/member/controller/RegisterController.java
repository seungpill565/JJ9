package com.spring.jj9.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String registerMember(Member member, HttpServletRequest request) throws IOException {
		
		String member_id = member.getMember_id();
		String member_password = member.getMember_password();
		String member_rePassword = member.getMember_rePassword();
		
		String phone1 = member.getPhone1();
		String phone2 = member.getPhone2();
		String phone3 = member.getPhone3();
		
		log.info("적은 아이디가 오는지 확인 " + member_id);
		log.info("비밀번호와 비밀번호 재확인 " + member_password);
		log.info("재확인 " + member_rePassword);
		
		log.info("phone 1 : " + phone1);
		log.info("phone 2 : " + phone2);
		log.info("phone 3 : " + phone3);
		
		String phoneNum = phone1 + "-" +  phone2 + "-" + phone3;
		member.setMember_phoneNum(phoneNum);
		
		if (
				member_id == null || member_id.equals("") ||
				member_password == null || member_password.equals("") ||
				member_rePassword == null || member_rePassword.equals("")
		) {
			request.setAttribute("msg", "아이디/비밀번호/비밀번호 재확인은 공백일 수 없습니다.\\n다시 시도해주세요");
			request.setAttribute("url", "/jj9/register");
			return "registerAlert";
		} else if (!member_password.equals(member_rePassword)) {

			request.setAttribute("msg", "비밀번호가 일치하지 않습니다. \\n다시 입력해주세요");
			request.setAttribute("url", "/jj9/register");
			return "registerAlert"; 
		} else {
			Integer id = service.insertMember(member);
				
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
			request.setAttribute("url", "/jj9/list");
			return "registerAlert";		
		}
		
	}
	
	// ID 중복 확인
	@ResponseBody
	@PostMapping(value="/idCheck", produces = MediaType.TEXT_PLAIN_VALUE)
	public String idCheck(Member member, @RequestParam String ID, Model model) {
		
		
		log.info(ID);
		
		member.setCheck_id(ID);
		String chk_id = member.getCheck_id();
		log.info(chk_id);
		
		Integer row = service.idCheck(ID);
		
		if (row == 0) {
			return "0";
		} else {
			return "-1";
		}
		
	} 
	
}
