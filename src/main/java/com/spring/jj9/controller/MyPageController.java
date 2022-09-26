package com.spring.jj9.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.jj9.addcoupon.service.AddCouponService;
import com.spring.jj9.buytalent.service.BuyHistoryService;
import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.note.service.NoteService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.selltalent.service.SellTalentService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MyPageController {
	
	@Autowired
	BuyHistoryService buyService;
	
	@Autowired
	NoteService noteService;
	
	@Autowired
	AddCouponService addCouponService;
	
	@Autowired
	SellTalentService sellTalentService;
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService service;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	String member_id;

	
	@GetMapping("/account/mypage")
	public String mypage(HttpSession session, HttpServletRequest request, Model model, Criteria cri) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
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
		return "account/sell-talent";
	}
	
	@GetMapping("/account/sell-talent")
	public String shoppingCart(HttpSession session, 
			HttpServletRequest request,
			Talent_list taleList,
			Model model, Criteria cri) {
		try {
			 member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		
			List<Talent_list> talent_list = sellTalentService.getTalentList(member_id);
			if(talent_list.size() == 0) {
				model.addAttribute("talent","1");
			}else {
				model.addAttribute("talent",talent_list);
			}
			
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
		return "account/sell-talent";
	}


	
	@GetMapping("/account/purchase-history")
	public String purchaseHistory(HttpSession session, HttpServletRequest request, Model model, Criteria cri) {
		String member_id = null;
		try {
			member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
	
		List<Pay_talentList> payNullList = buyService.getPayTalNull(member_id);
		
		if(payNullList.size() == 0) {
			model.addAttribute("payTalNull", "1");
		} else {
			model.addAttribute("payTalNull", payNullList);			
		}
		
		
		List<Pay_talentList> payRequestList = buyService.getPayTalRequest(member_id);
		
		if(payRequestList.size() == 0) {
			model.addAttribute("payTalRequest", "1");
		} else {
			model.addAttribute("payTalRequest", payRequestList);
		}
		
		
		List<Pay_talentList> payRefundList = buyService.getPayTalRefund(member_id);
		
		if(payRefundList.size() == 0) {
			model.addAttribute("payTalRefund", "1");
		} else {
			model.addAttribute("payTalRefund", payRefundList);
		}
		
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
		
		return "account/purchase-history";
	}
	
	@GetMapping("/account/note")
	public String note(HttpSession session, HttpServletRequest request,Model model, Criteria cri) {
		try {
			member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		List<Message>resiver =  noteService.getResiver(member_id);
		List<Message>sender = noteService.getSender(member_id);
		
		if(resiver.size() == 0) {
			model.addAttribute("resiver","1");
		}else {
			model.addAttribute("resiver",resiver);
		}
		
		if(sender.size() == 0) {
			model.addAttribute("sender","1");
		}else {
			model.addAttribute("sender",sender);
		}
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
		
		
		return "account/note";
	}
	
	@GetMapping("/account/add-coupon")
	public String addCoupon(HttpSession session, HttpServletRequest request, Model model, Criteria cri) {
		try {
			member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		List<Coupon> coupon = addCouponService.getCouponList(member_id);
		
		if(coupon.size() == 0) {
			model.addAttribute("coupon","1");
		}else {
			model.addAttribute("coupon",coupon);
		}
		
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
		
		return "account/add-coupon";
	}
	

	
}
