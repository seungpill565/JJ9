package com.spring.jj9.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.spring.jj9.dto.Coupon;
import com.spring.jj9.order.service.OrderService;

@RestController
public class OrderRestController {
	
	@Autowired
	OrderService service;
	
	String id = "abcd";
	
	@GetMapping(value = "/couponlist/{id}",produces = MediaType.APPLICATION_JSON_VALUE)
	public Coupon getCouponList(@PathVariable("id") int id) {
		Coupon coupondiscount = service.getdiscount(id);		 
		return coupondiscount;
	}

}
