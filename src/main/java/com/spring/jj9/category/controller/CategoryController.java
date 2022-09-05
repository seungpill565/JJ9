package com.spring.jj9.category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.util.CategoryPageVO;
import com.spring.jj9.util.Criteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping(value="/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
//	@GetMapping("/category") // 일단 테스트 카테 페이지로
//	public void gocate() {
//		
//	}

	@GetMapping("/{id}")
	public String category1(@PathVariable("id") int id, Model model, Criteria cri) {
		//log.info(service.readCategory(id));
		model.addAttribute("subcategorys", service.readMainCategory(id));
		model.addAttribute("maincategorys", service.readAllMainCategory());
		model.addAttribute("purchases", service.readTalentAllByCate_main(id));
//		log.info("1로그 : ",service.readMainCategory(id));
//		log.info("2로그 : ",service.readTalentAllByCate_main(id));
		
		// 첫번째 페이징 코드
//		Criteria cri = new Criteria();
//		CategoryPageVO pageVO = new CategoryPageVO(cri, service.readTotalCategory());
//		model.addAttribute("pagevo", pageVO);
//		model.addAttribute("pages", service.readTalentAllByRownum(cri));
		
		model.addAttribute("list", service.readTalentAllByRownum(cri));
		CategoryPageVO pageVO = new CategoryPageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(service.readTotalTalent());
		
		model.addAttribute("pagemaker", pageVO);
		
		
		
		
		return "category/category"; // 해당 카테고리 클릭 시 페이지 이동
	}
}
