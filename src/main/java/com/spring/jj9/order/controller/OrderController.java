package com.spring.jj9.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.order.service.OrderService;

@Controller
public class OrderController {
	
	String sessionId="abcd";
	
	@Autowired
	OrderService service;
	
	@PostMapping(value = "/order/{id}")
	public String OrderView(@PathVariable("id") int id, Model model) {
		List<TalentAll> talentAll = service.getList(id);
		List<Coupon>coupon = service.getCoupon(sessionId);
		
		model.addAttribute("coupon",coupon);
		model.addAttribute("order",talentAll);
		 
		return "Order";
	}
	

}
