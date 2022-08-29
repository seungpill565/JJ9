package com.spring.jj9.write;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class InsertController {
	
	@GetMapping(value = "/sample")
	public String getPizza() {
		
		
		return "write/insertTalent";
	}
}
