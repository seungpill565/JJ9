package com.spring.jj9.request.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Talent_request;
import com.spring.jj9.request.service.RequestHomeService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping(value="/req")
@Controller
public class RequestHomeController {
	
	
	@Autowired
	private RequestHomeService service;
	
	@Autowired
	private RequestService service2;
	
	@GetMapping(value={"/{id}"})
	public String requestHome(@PathVariable("id") int id, Model model, Criteria cri) {

		model.addAttribute("subcategorys", service.readCategory(id)); // 서브카테고리 
		model.addAttribute("maincategorys", service.readAllMainCategory()); // 메인카테고리
		//model.addAttribute("purchases", service.readTalentAllByMainOrSub(id)); // 카테고리별 재능들

		model.addAttribute("purchases", service.readRequestAllForPaging(cri, id));
		
		int cateTotal = service.readRequestAllByMainOrSubCount(id); // 카테고리별 재능의뢰의 총 개수 
		System.out.println("id : " + id + "cri pagenum: " + cri.getPageNum() + " cri amout : " + cri.getAmount());
		
		PageMake page = new PageMake(cri, cateTotal);
		
		model.addAttribute("page", page);
		
		// 메인 카테고리들을 Attribute에 실어준다
		List<Category> categories = service2.getMainCategories();
		model.addAttribute("mainCates", categories);
		
		int i = 1;
		// 메인 카테고리에 따른 서브카테고리들을 Attribute에 실어준다.
		for (Category cate : categories) {
			String key = "sub" + i;
			model.addAttribute(key, service2.getSubCateByMain(cate.getCate_main()));
			i++;
		}
		
		List<Talent_request> request_list = service2.getRequestList();
		model.addAttribute("requests", request_list);
		
		
		return "request/home"; // 해당 카테고리 클릭 시 페이지 이동
	}
}
