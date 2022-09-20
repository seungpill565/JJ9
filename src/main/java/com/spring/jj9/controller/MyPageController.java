package com.spring.jj9.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MyPageController {
	
	@GetMapping("/account/mypage")
	public String mypage(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/mypage";
	}
	
	@GetMapping("/account/sell-talent")
	public String shoppingCart(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/sell-talent";
	}
	
	@GetMapping("/account/purchase-history")
	public String purchaseHistory(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/purchase-history";
	}
	
	@GetMapping("/account/note")
	public String note(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/note";
	}
	
	@GetMapping("/account/add-coupon")
	public String addCoupon(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/add-coupon";
	}
	
	@GetMapping("/account/inquiry")
	public String inquiry(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/inquiry";
	}
	
	
	@GetMapping("/account/secession")
	public String secession(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/secession";
	}
	
}
