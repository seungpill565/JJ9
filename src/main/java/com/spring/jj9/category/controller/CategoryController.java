package com.spring.jj9.category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.category.service.CategoryService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping(value="/category")
@Controller
public class CategoryController {
	
	@Autowired
	CategoryService service;

	@GetMapping("/")
	public String category1() {
		
		return "";
	}
	
	@GetMapping("/2")
	public void category2() {
		
	}
	
	@GetMapping("/3")
	public void category3() {
		
	}
	
	@GetMapping("/4")
	public void category4() {
		
	}
	
	@GetMapping("/5")
	public void category5() {
		
	}
	
	@GetMapping("/6")
	public void category6() {
		
	}
	
	@GetMapping("/7")
	public void category7() {
		
	}
	
}
