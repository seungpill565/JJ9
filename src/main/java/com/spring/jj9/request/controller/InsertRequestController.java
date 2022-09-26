package com.spring.jj9.request.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.add.service.CateService;
import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Talent_request;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;
import com.spring.jj9.util.ScriptAlertUtils;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class InsertRequestController {
	
	@Autowired
	CateService cateService;
	
	@Autowired
	RequestService requestService;
	
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService mainservice;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	String session_id = null;
	
	@RequestMapping("/insertRequest")
	public String insert(HttpServletResponse response, HttpSession session, Model model,  Criteria cri) {
		
		try {
			session_id = session.getAttribute("member_id").toString();
		} catch (NullPointerException e) {
			try {
				ScriptAlertUtils.alertAndMovePage(response ,"로그인 페이지로 이동합니다.","/jj9/login");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		model.addAttribute("mainCates", cateService.getCategories()); 
		
		// ----- 카테고리 갖고오는 코드 시작
		model.addAttribute("subcategorys", mainservice.readAllSubCategory()); // 서브카테고리만 실어준다
		model.addAttribute("maincategorys", mainservice.readMainCategory());  // 메인카테고리만 실어준다
		model.addAttribute("bestpurchases", mainservice.readBestPurchase());
		model.addAttribute("newpurchases", mainservice.readNewPurchase());
	
		PageMake page = new PageMake(cri, categoryService.readTalentCountBySearch(cri.getKeyword()));
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
		
		
		return "request/insertRequest";
	}
	
	// talent_request 테이블에 데이터 추가.
	@PostMapping(value = "/insertRequest")
	public String insertRequest(Talent_request tr, @ModelAttribute("cate-sub") String cate_sub, HttpServletResponse response) {
		
		try {
			//log.info("로그찍어보기 : " + tr.getTrequest_deadline());
			
			if (cate_sub == null || cate_sub.equals("") || cate_sub.equals("null")) {
				ScriptAlertUtils.alertAndBackPage(response, "카테고리를 선택해주세요!");
			}
			
			// 오늘 날짜..
			tr.setTrequest_date(Date.valueOf(LocalDate.now()));
			// sub 카테고리로 카테고리 ID 가져오기
			tr.setCate_id(cateService.getCateIdBySub(cate_sub));
			
			// 마감일이 오늘과 같거나 오늘보다 이전일경우 alert
			if (tr.getTrequest_date().equals(tr.getTrequest_deadline()) || tr.getTrequest_date().after(tr.getTrequest_deadline())) {
				ScriptAlertUtils.alertAndBackPage(response, "마감일이 잘못되었습니다!");
			} else if (tr.getTrequest_budget() == null || tr.getTrequest_budget().equals("")) {
				ScriptAlertUtils.alertAndBackPage(response, "예산을 입력해주세요!");
			} else if (tr.getTrequest_title() == null || tr.getTrequest_title().equals("")) {
				ScriptAlertUtils.alertAndBackPage(response, "제목을 입력해주세요!");
			}  else if (tr.getTrequest_content() == null || tr.getTrequest_content().equals("")) {
				ScriptAlertUtils.alertAndBackPage(response, "내용을 입력해주세요!");
			}
			
			requestService.insertRequest(tr);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "request/home";
	}
	

}
