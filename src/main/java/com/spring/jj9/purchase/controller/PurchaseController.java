package com.spring.jj9.purchase.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.purchase.service.PurchaseService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

@Controller
public class PurchaseController {
	
	String sessionId=null;
	
	@Autowired
	DataSource ds;
	
	@Autowired
	PurchaseService service;
	
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService mainservice;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	@GetMapping(value = "/purchase/{id}")
	public String PurchaseView(
			@PathVariable("id") int id,
			Model model,
			HttpSession session,  Criteria cri) {
		try {
			sessionId = session.getAttribute("member_id").toString();
			model.addAttribute("login",sessionId);
		}catch(NullPointerException e) {
			model.addAttribute("login","");
		}
		
	
		
		List<TalentAll> talentAll = service.getList(id);
		List<TalentAll> talentReivew = service.getReviewList(id);
		Double gradeAvg = service.getSumReviewGrade(id);
		
		int countGrade = service.getCountGrade(id);
		
		model.addAttribute("purchase",talentAll);
		model.addAttribute("Reivew",talentReivew);
		model.addAttribute("RradeAvg",gradeAvg);
		model.addAttribute("CountGrade",countGrade);
		/////////
		// ----- 카테고리 갖고오는 코드 시작
		model.addAttribute("subcategorys", mainservice.readAllSubCategory()); // 서브카테고리만 실어준다
		model.addAttribute("maincategorys", mainservice.readMainCategory());  // 메인카테고리만 실어준다
		model.addAttribute("bestpurchases", mainservice.readBestPurchase());
		model.addAttribute("newpurchases", mainservice.readNewPurchase());
	
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
        // ----- 카테고리 갖고오는 코드 끝
		 
		return "Purchase";
	}

}
