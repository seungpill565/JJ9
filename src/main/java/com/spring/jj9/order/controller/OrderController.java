package com.spring.jj9.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.Pay;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.order.service.OrderService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class OrderController {
	
	String sessionId="abcd";
	int talentId = 0;
	
	@Autowired
	OrderService service;
	
	@GetMapping(value = "/order/{id}")
	public String OrderView(@PathVariable("id") int id, Model model) {
		talentId = id;
		List<TalentAll> talentAll = service.getList(id);
		List<Coupon>coupon = service.getCoupon(sessionId);
		
		model.addAttribute("coupon",coupon);
		model.addAttribute("order",talentAll);
		 
		return "Order";
	}
	
	@PostMapping(value = "/order/completed")                       //  required = false : 널값 포함
	public String Ordercompleted(@RequestParam(value = "order" ,required = false)String order, 
			@RequestParam("money")String money,
			@RequestParam("original-money")String originalMoney,
			@RequestParam("name")String name,
			Pay pay, Model model ,
			HttpServletRequest req,
			Coupon coupon, Member member) {
		
		log.info("결제 수단 :::"+order);
		//결제 수단 선택 안할시
		if(order == null || order.equals("")) {
			req.setAttribute("msg", "결제 수단을 선택해 주세요");
			req.setAttribute("url", "/jj9/order/"+talentId);
			return "Orderalert";
		}
			//pay insert
			int getOriginalMoney = Integer.parseInt(originalMoney); // 할적용x 금액
			int getmoney  = Integer.parseInt(money); // 할인적용된 금액 
			String talentMember = service.getTalentId(talentId); //판매자 아이디
			pay.setPay_way(order);
			pay.setMember_id(sessionId);
			pay.setPay_money(getmoney);
			pay.setTalent_id(talentId);
			pay.setPay_original_money(getOriginalMoney);
			
			service.insertPay(pay);
			
	//		Pay pays = service.getPay(sessionId);
	//		model.addAttribute("pay",pays);
			
			model.addAttribute("id",sessionId);
			model.addAttribute("way",order);
			model.addAttribute("money",getmoney);
			
			//point update
			int getPoint = service.getPoint(talentMember); // 현재 보유 포인트
			log.info("현재포인" + getPoint);
			
			int plustPoint = getPoint+getmoney;
			log.info("더한값" + plustPoint);
			
			member.setMember_point(plustPoint); // 가져온 금액 + 해주기
			member.setMember_id(talentMember); //판매자 아이디로 설정
			service.updatePoint(member); // 포인트 업테이트
			
			//coupon update
			int couponName = Integer.parseInt(name);
			
			coupon.setCoupon_id(couponName);
			coupon.setMember_id(sessionId);
			log.info("쿠폰 아이디" +couponName);
			if(couponName != 0 || couponName != 5){
				service.updateCoupon(coupon);
			}
				return "OrderCompleted";
		}
	

}
