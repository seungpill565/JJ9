package com.spring.jj9.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
//@RequestMapping(value="/category")
@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@Autowired
    RequestService reqservice;
	
	@GetMapping(value={"/category/{id}"})
	public String category1(@PathVariable("id") int id, Model model, Criteria cri) {

		model.addAttribute("subcategorys", service.readCategory(id)); // 서브카테고리
		model.addAttribute("maincategorys", service.readAllMainCategory()); // 메인카테고리

		model.addAttribute("purchases", service.readTalentAllForPaging(cri, id)); // 재능들 12개씩 불러오기
		
		int cateTotal = service.readTalentAllByMainOrSubCount(id); // 카테고리별 재능의 총 개수 
		//System.out.println("id : " + id + "cri pagenum: " + cri.getPageNum() + " cri amout : " + cri.getAmount());
		
		PageMake page = new PageMake(cri, cateTotal);
		
		model.addAttribute("page", page);
		
		// 메인 카테고리들을 Attribute에 실어준다
        List<Category> categories = reqservice.getMainCategories();
        model.addAttribute("mainCates", categories);

        int i = 1;
        // 메인 카테고리에 따른 서브카테고리들을 Attribute에 실어준다.
        for (Category cate : categories) {
            String key = "sub" + i;
            model.addAttribute(key, reqservice.getSubCateByMain(cate.getCate_main()));
            i++;
        }
		
		
		
		return "category/category"; // 해당 카테고리 클릭 시 페이지 이동
	}
	
	@GetMapping(value="/search")
	public String search(Model model, Criteria cri) { // 검색했을때 search 페이지로 보낼 메서드
		
		model.addAttribute("maincategorys", service.readAllMainCategory()); // 메인카테고리 // 검색했을땐 메인카테고리만 표시
		
		model.addAttribute("purchases",service.readTalentAllBySearch(cri)); // 검색한 재능들
		System.out.println("type : " + cri.getType());
		
		int total = service.readTalentCountBySearch(cri.getKeyword()); // 검색한 재능들 총 개수 
		
		PageMake page = new PageMake(cri, total); // 페이지네이션
		model.addAttribute("page", page); 
		
		// 메인 카테고리들을 Attribute에 실어준다
        List<Category> categories = reqservice.getMainCategories();
        model.addAttribute("mainCates", categories);

        int i = 1;
        // 메인 카테고리에 따른 서브카테고리들을 Attribute에 실어준다.
        for (Category cate : categories) {
            String key = "sub" + i;
            model.addAttribute(key, reqservice.getSubCateByMain(cate.getCate_main()));
            i++;
        }
		

		
		return "search/search";
	}
}
