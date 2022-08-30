package com.spring.jj9.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.TalentAll;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping(value="/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@GetMapping("/category") // 일단 테스트 카테 페이지로
	public void gocate() {
		
	}

	@GetMapping("/{id}")
	public String category1(@PathVariable("id") int id, Model model) {
		List<TalentAll> talent = service.readTalentById(id); // 카테id로 모든 정보 불러야된다
		model.addAttribute("categorys", service.readCategory());
		
		return "category/category"; // 해당 카테고리 클릭 시 페이지 이동
	}
//	
//	@GetMapping("/2")
//	public void category2() {
//		
//	}
//	
//	@GetMapping("/3")
//	public void category3() {
//		
//	}
//	
//	@GetMapping("/4")
//	public void category4() {
//		
//	}
//	
//	@GetMapping("/5")
//	public void category5() {
//		
//	}
//	
//	@GetMapping("/6")
//	public void category6() {
//		
//	}
//	
//	@GetMapping("/7")
//	public void category7() {
//		
//	}
	
}