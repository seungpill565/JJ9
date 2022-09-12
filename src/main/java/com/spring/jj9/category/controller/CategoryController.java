package com.spring.jj9.category.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping(value="/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@GetMapping(value={"/{id}"})
	public String category1(@PathVariable("id") int id, Model model, Criteria cri) {

		model.addAttribute("subcategorys", service.readCategory(id)); // 서브카테고리 
		model.addAttribute("maincategorys", service.readAllMainCategory()); // 메인카테고리
		//model.addAttribute("purchases", service.readTalentAllByMainOrSub(id)); // 카테고리별 재능들

		model.addAttribute("purchases", service.readTalentAllForPaging(cri, id));
		
		int cateTotal = service.readTalentAllByMainOrSubCount(id); // 카테고리별 재능의 총 개수 
		System.out.println("id : " + id + "cri pagenum: " + cri.getPageNum() + " cri amout : " + cri.getAmount());
		
		PageMake page = new PageMake(cri, cateTotal);
		
		model.addAttribute("page", page);
		
		
		
		
		return "category/category"; // 해당 카테고리 클릭 시 페이지 이동
	}
}
