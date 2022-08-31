package com.spring.jj9.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.RegisterService;

@RestController
public class RegisterRestController {

	@Autowired
	RegisterService service;
	
	
	
	
}
