package com.spring.jj9.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Member;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.member.service.LoginService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class LoginController {
	
	@Inject
	LoginService loginService;
	
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService service;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	
	@GetMapping(value = "login")
	public String loginPage(HttpSession session, HttpServletRequest request, Model model, Criteria cri) {
		
		// 로그인 시 session에 로그인 정보가 있으면 로그인 페이지로 이동시키지 않음
		try {
			String member_id = session.getAttribute("member_id").toString();
			if (member_id.equals("admin")) {
				request.setAttribute("msg", "이미 로그인 + 관리자 페이지로 이동");
				request.setAttribute("url", "/jj9/admin");
			} else {
				request.setAttribute("msg", "이미 로그인이 되었습니다. 메인페이지로 이동합니다.");
				request.setAttribute("url", "/jj9/mainpage");				
			}			
		} catch (NullPointerException e) {
			
			// ----- 카테고리 갖고오는 코드 시작
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
	        // ----- 카테고리 갖고오는 코드 끝
			return "login";
		}
		
		
		return "alert";
		
	}
	
	@RequestMapping("login_check")
	public ModelAndView login_check(@ModelAttribute Member member, 
			HttpSession session, ModelAndView mav) {
		log.info("id " + member.getMember_id() + " pw: " + member.getMember_password());
		
		String name = loginService.login(member);
		
		if (name != null) { // 아이디가 있는경우 세션에 아이디와 이름을 담음
			session.setAttribute("member_id", member.getMember_id());
			session.setAttribute("member_name", name);
			
			/*
			  제 설계 실수로 model and view 를 만들어서 쓸모없는 justMove 페이지를 만들었습니다^^... 
			  ModelAndView 는 주소가 이동하지 않고 화면에 보이는 페이지만 이동합니다. 
			  이 문제를 해결하기 위해 justMove 페이지를 만들었습니다.
			  
			  justMove 페이지는 main 페이지로 바로 이동하게 만드는 페이지이기 때문에 이건 무시하셔도 됩니다.
			*/
			
			if (member.getMember_id().equals("admin")) { // 아이디가 admin일 경우
				mav.setViewName("goAdmin");
				mav.addObject("message", "success");
			} else {
				mav.setViewName("justMove"); // justMove -> 바로 main페이지로 이동
				mav.addObject("message", "success");				
			}
			
		} else { // 아이디가 없는경우 로그인페이지로 가야함
			mav.setViewName("login");
			mav.addObject("message", "error");
		}
		
		return mav;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login?message=logout";
	}
}
