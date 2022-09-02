package com.spring.jj9.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.dto.Category;
import com.spring.jj9.request.service.RequestService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class RequestHomeController {
	
	@Autowired
	RequestService service;
	
	@RequestMapping("/request")
	public String requestHome(Model model) {
		
		// 메인 카테고리들을 Attribute에 실어준다
		List<Category> categories = service.getMainCategories();
		model.addAttribute("mainCates", categories);
		
		int i = 1;
		// 메인 카테고리에 따른 서브카테고리들을 Attribute에 실어준다.
		for (Category cate : categories) {
			String key = "sub" + i;
			model.addAttribute(key, service.getSubCateByMain(cate.getCate_main()));
			i++;
		}
		
		return "request/home";
	}
	
	
	
}
