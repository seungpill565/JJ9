package com.spring.jj9.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.MyPageService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberModifyController {
	
	MyPageService service;
	
	@Autowired
	public MemberModifyController(MyPageService service) {
		this.service = service;
	}
	
	@GetMapping("/account/member-modify")
	public String memberModify(HttpSession session, HttpServletRequest request, Member member, Model model) {
		
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		// 회원 정보를 가져오는 서비스를 만들어야 함
		member.setMember_id(session.getAttribute("member_id").toString());		
		String mid = member.getMember_id();
		log.info(mid);
		
		Member m_member = service.getMember(mid);
		model.addAttribute("member", m_member);
		
		return "account/member-modify";
	}
	
	@ResponseBody
	@PostMapping(value="account/member-update", produces = MediaType.TEXT_PLAIN_VALUE)
	public String MemberUpdate(
				@RequestParam String name, 
				@RequestParam String nickName, 
				@RequestParam String email, 
				@RequestParam String phone,
				@RequestParam String point,
				@RequestParam String birthday,
				HttpSession session
			) {
		
		log.info("name : " + name);
		log.info("nickName : " + nickName);
		log.info("email : " + email);
		log.info("phone : " + phone);
		log.info("point : " + point);
		log.info("birthday : " + birthday);
		
		String member_id = session.getAttribute("member_id").toString();
		
		Integer row = service.updateMember(name, nickName, email, phone, point, birthday, member_id);
		
		log.info("updateMember의 결과? : " + row);
		
		if (row == 1) { // update가 잘 됨
			session.setAttribute("member_name", name);
			return "1";
		} else {
			return "0"; // update가 안 됨
		}
		
	}
	
	@ResponseBody
	@PostMapping(value="account/password-update", produces = MediaType.TEXT_PLAIN_VALUE)
	public String passwordUpdate(
				@RequestParam String password_original,		// 현재 비밀번호를 받아옴
				@RequestParam String change_password,		// 변경할 비밀번호
				@RequestParam String change_repassword,		// 비밀번호 재입력
				HttpSession session,
				Member member
			) {
		log.info("password_original : " + password_original);
		// ★ password_original 이 session 에 담긴 member_id 의 password 와 같은지 1차적으로 검토해야함, 같지않으면 리턴
		// ★ change_password 와 change_repassword 가 같은 값인지 한 번 확인해야함, 같지 않으면 리턴
		// ★ 비밀번호를 변경한 이후에 마이페이지로 이동시킴
		
		// ★ 아직 member_id를 안넣었음... 이거 빨리 수정...
		String member_id = session.getAttribute("member_id").toString();
		
		member = service.getMember(member_id);
		
		if (!member.getMember_password().equals(password_original)) { // 계정의 비밀번호와 같은지 1차 검토
			return "-1";
		}
		
		if (!change_password.equals(change_repassword)) {
			return "-2";
		}
		
		Integer row = service.updatePassword(change_password, member_id);
		
		log.info("updatePassword의 결과? : " + row);
		
		if (row == 1) { // update가 잘 됨
			return "1";
		} else {
			return "0"; // update가 안 됨
		}
	}
	
}
