package com.spring.jj9.request.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.jj9.request.service.RequestService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class RequestInfoController {
	
	
	@Autowired
	RequestService reqService;
	
	@GetMapping(value = "/request/{req_id}")
	public String requestInfo(@PathVariable("req_id") Integer id, Model model) {
		
		log.info("아이디 : " + id);
		
		model.addAttribute("reqAll", reqService.getRequestAllById(id)); 
		
		return "request/requestInfo";
	}

}
