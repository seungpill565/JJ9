package com.spring.jj9.addcoupon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.jj9.addcoupon.service.AddCouponService;
import com.spring.jj9.dto.Coupon;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AddCouponcontroller {
	
	String member_id;
	int update ;
	
	
	@Autowired
	AddCouponService service;
	
	@GetMapping(value ="/coupon/registration")
	public String moveCoupon(HttpSession session, HttpServletRequest request) {
		member_id = session.getAttribute("member_id").toString();
		return "addcouponinsert";
		
	}
	@PostMapping(value="/coupon/insert")
	public String insertCoupon(HttpServletRequest req) {
		String code = req.getParameter("coupon_value");
		
		if( code == null || code.equals("")) {
			req.setAttribute("msg", "쿠폰 번호를 입력 하세요");
			req.setAttribute("url", "../coupon/registration");
			return "Messagealert";
		}
		if(service.selectCoupon(code).size() == 0) {
			req.setAttribute("msg", "이미 사용된 쿠폰입니다.");
			req.setAttribute("url", "../coupon/registration");
			return "Messagealert";
		}
			update = service.addCoupon(member_id,code);
			log.info(update);
			if(update == 0) {
				req.setAttribute("msg", "옳은 쿠폰 번호가 아닙니다.");
				req.setAttribute("url", "../coupon/registration");
				return "Messagealert";
			}	
			
			req.setAttribute("msg", "쿠폰이 등록 되었습니다.");
			req.setAttribute("url", "../coupon/registration");
			return "Messagealert";
		
	}

}
