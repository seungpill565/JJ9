package com.spring.jj9.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.jj9.addcoupon.service.AddCouponService;
import com.spring.jj9.buytalent.service.BuyHistoryService;
import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.note.service.NoteService;
import com.spring.jj9.selltalent.service.SellTalentService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MyPageController {
	
	@Autowired
	BuyHistoryService buyService;
	
	@Autowired
	NoteService noteService;
	
	@Autowired
	AddCouponService addCouponService;
	
	@Autowired
	SellTalentService sellTalentService;
	
	String member_id;

	
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
	public String shoppingCart(HttpSession session, 
			HttpServletRequest request,
			Talent_list taleList,
			Model model) {
		try {
			 member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		
			List<Talent_list> talent_list = sellTalentService.getTalentList(member_id);
			if(talent_list.size() == 0) {
				model.addAttribute("talent","1");
			}else {
				model.addAttribute("talent",talent_list);
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
		
	
		List<Pay_talentList> payNullList = buyService.getPayTalNull(member_id);
		
		if(payNullList.size() == 0) {
			model.addAttribute("payTalNull", "1");
		} else {
			model.addAttribute("payTalNull", payNullList);			
		}
		
		
		List<Pay_talentList> payRequestList = buyService.getPayTalRequest(member_id);
		
		if(payRequestList.size() == 0) {
			model.addAttribute("payTalRequest", "1");
		} else {
			model.addAttribute("payTalRequest", payRequestList);
		}
		
		
		List<Pay_talentList> payRefundList = buyService.getPayTalRefund(member_id);
		
		if(payRefundList.size() == 0) {
			model.addAttribute("payTalRefund", "1");
		} else {
			model.addAttribute("payTalRefund", payRefundList);
		}
		
		return "account/purchase-history";
	}
	
	@GetMapping("/account/note")
	public String note(HttpSession session, HttpServletRequest request,Model model) {
		try {
			member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		List<Message>resiver =  noteService.getResiver(member_id);
		List<Message>sender = noteService.getSender(member_id);
		
		if(resiver.size() == 0) {
			model.addAttribute("resiver","1");
		}else {
			model.addAttribute("resiver",resiver);
		}
		
		if(sender.size() == 0) {
			model.addAttribute("sender","1");
		}else {
			model.addAttribute("sender",sender);
		}
		
		
		
		return "account/note";
	}
	
	@GetMapping("/account/add-coupon")
	public String addCoupon(HttpSession session, HttpServletRequest request,Model model) {
		try {
			member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		List<Coupon> coupon = addCouponService.getCouponList(member_id);
		
		if(coupon.size() == 0) {
			model.addAttribute("coupon","1");
		}else {
			model.addAttribute("coupon",coupon);
		}
		
		
		
		return "account/add-coupon";
	}
	

	
}
