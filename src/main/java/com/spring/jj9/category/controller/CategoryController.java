package com.spring.jj9.category.controller;

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
		//log.info(service.readCategory(id));
		model.addAttribute("subcategorys", service.readMainCategory(id)); // 서브카테고리 
		model.addAttribute("maincategorys", service.readAllMainCategory()); // 메인카테고리
		model.addAttribute("purchases", service.readTalentAllByMainOrSub(id)); // 카테고리별 재능들
//		log.info("1로그 : ",service.readMainCategory(id));
//		log.info("2로그 : ",service.readTalentAllByCate_main(id));
		
		// 첫번째 페이징 코드
//		Criteria cri = new Criteria();
//		CategoryPageVO pageVO = new CategoryPageVO(cri, service.readTotalCategory());
//		model.addAttribute("pagevo", pageVO);
//		model.addAttribute("pages", service.readTalentAllByRownum(cri));
		//////////////////////////////////////////////////////////////////////////////
		
		//cri.setPageNum(id);
		model.addAttribute("lists", service.readTalentAllForPaging(cri)); // 페이징 할 재능 10개
//		CategoryPageVO pageVO = new CategoryPageVO();
//		pageVO.setCri(cri);
//		pageVO.setTotalCount(service.readTotalTalent());
		
		//int total = service.readTotalTalent(); // 해당 카테고리에 등록되어있는 재능의 총합
		int cateTotal = service.readTalentAllByMainOrSubCount(id); // 카테고리별 재능의 총 개수 
		
		PageMake page = new PageMake(cri, cateTotal);
		
		model.addAttribute("page", page);
		
		
		
		
		return "category/category"; // 해당 카테고리 클릭 시 페이지 이동
	}
}
