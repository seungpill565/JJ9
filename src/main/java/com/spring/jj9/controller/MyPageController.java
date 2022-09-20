package com.spring.jj9.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.jj9.buytalent.service.BuyHistoryService;
import com.spring.jj9.dto.Pay_talentList;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MyPageController {
	
	@Autowired
	BuyHistoryService buyService;
	
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
	public String purchaseHistory(HttpSession session, HttpServletRequest request, Model model) {
		String member_id = null;
		try {
			member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		// 로그인 된 회원의 결제내역과 결제한 talent의 정보를 가져온다.
		// 환불요청 = Null인경우
		List<Pay_talentList> payNullList = buyService.getPayTalNull(member_id);
		
		if(payNullList.size() == 0) {
			model.addAttribute("payTalNull", "1");
		} else {
			model.addAttribute("payTalNull", payNullList);			
		}
		
		// 환불요청 상태인 경우
		List<Pay_talentList> payRequestList = buyService.getPayTalRequest(member_id);
		
		if(payRequestList.size() == 0) {
			model.addAttribute("payTalRequest", "1");
		} else {
			model.addAttribute("payTalRequest", payRequestList);
		}
		
		// 환불완료 상태인 경우
		List<Pay_talentList> payRefundList = buyService.getPayTalRefund(member_id);
		
		if(payRefundList.size() == 0) {
			model.addAttribute("payTalRefund", "1");
		} else {
			model.addAttribute("payTalRefund", payRefundList);
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
	
	@GetMapping("/account/member-modify")
	public String memberModify(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/member-modify";
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
