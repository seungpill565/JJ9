package com.spring.jj9.mainpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
//@RequestMapping(value="/mainpage")
@Controller
public class MainPageController {

	
	@GetMapping(value="/mainpage")
	public void mainpage() { //mainpage.jsp로 가는 메서드
		
	}
	
}
