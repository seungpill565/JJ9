package com.spring.jj9.mainpage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
//@RequestMapping(value="/mainpage")
@Controller
public class MainpageController {
	
	@Autowired
	private MainpageService service;
	
	@Autowired
	private CategoryService cateService;

	@Autowired
    RequestService reqservice;
	
	@GetMapping(value="/mainpage")
	public String mainpage(Model model, Criteria cri) { //mainpage.jsp로 가는 메서드
		//log.info(service.readMainCategory());
		
		model.addAttribute("subcategorys", service.readAllSubCategory()); // 서브카테고리만 실어준다
		model.addAttribute("maincategorys", service.readMainCategory());  // 메인카테고리만 실어준다
		model.addAttribute("bestpurchases", service.readBestPurchase());
		model.addAttribute("newpurchases", service.readNewPurchase());
	
		PageMake page = new PageMake(cri, cateService.readTalentCountBySearch(cri.getKeyword()));
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
		
		return "mainpage/mainpage";
	}
	
}
