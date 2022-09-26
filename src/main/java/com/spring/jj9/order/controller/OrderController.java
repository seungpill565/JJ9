package com.spring.jj9.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Pay;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.order.service.OrderService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class OrderController {
	
	String sessionId= null;
	int talentId = 0;
	
	@Autowired
	OrderService service;
	
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService mainservice;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	@GetMapping(value = "/order/{id}")
	public String OrderView(
			@PathVariable("id") int id,
			Model model,
			HttpSession session, Criteria cri) {
		try {
			sessionId = session.getAttribute("member_id").toString();
		}catch(NullPointerException e) {
			sessionId = "로그인 필요함";
		}
		
		talentId = id;
		List<TalentAll> talentAll = service.getList(id);
		List<Coupon>coupon = service.getCoupon(sessionId);
		
		model.addAttribute("coupon",coupon);
		model.addAttribute("order",talentAll);
		
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
		
		
		return "Order";
	}
	
	@PostMapping(value = "/order/completed")                      
	public String Ordercompleted( 
			@RequestParam("money")String money,
			@RequestParam("original-money")String originalMoney,
			@RequestParam("name")String name,
			Pay pay, Model model ,
			HttpServletRequest req,
			HttpSession session,
			Coupon coupon, Member member) {
			// 맴버 정보 가져오기
		try {
			sessionId = session.getAttribute("member_id").toString();
		}catch(NullPointerException e) {
			req.setAttribute("msg", "로그인 후 결제가 가능합니다.");
			req.setAttribute("url", "/jj9/order/"+talentId);
			return "alert";
		}
		
		
		
			Member members = service.getMember(sessionId);
			model.addAttribute("members",members);
			
			String moneyReplace = money.replaceAll("\\,", "");
			String originalMoneyReplace = originalMoney.replaceAll("\\,", "");
	
			int getOriginalMoney = Integer.parseInt(originalMoneyReplace); // 할적용x 금액
			int getmoney  = Integer.parseInt(moneyReplace); // 할인적용된 금액 
			String talentTitle = service.getTalnetTitle(talentId); // 재능 이름
			
			log.info("갑가가가가가가 :"+talentTitle);
				
			model.addAttribute("id",sessionId);
			model.addAttribute("money",getmoney);
			model.addAttribute("originalMoney",getOriginalMoney);
			model.addAttribute("talneTitle",talentTitle);
			model.addAttribute("name",name);
			model.addAttribute("talentId",talentId);
			
	
				return "iamport";
		}
	
	@GetMapping(value = "/order/success")
	public String OderSuccess(
			HttpServletRequest request,
			Model model , Pay pay,
			Coupon coupon, Member member, Criteria cri) {
		String talentMember = service.getTalentId(talentId); // 판매자 아이디
		String talentTitle = service.getTalnetTitle(talentId); // 재능 이름
	
		//pay insert
		String originalMoney = request.getParameter("getOriginalMoney");
		String money = request.getParameter("money");
		
		
		int getmoney = Integer.parseInt(money);
		int getOriginalMoney = Integer.parseInt(originalMoney);
		
		pay.setMember_id(sessionId);
		pay.setPay_money(getmoney);
		pay.setTalent_id(talentId);
		pay.setPay_original_money(getOriginalMoney);
		
	
		service.insertPay(pay);
		model.addAttribute("id",sessionId);
		model.addAttribute("money",getmoney);
		model.addAttribute("talentTitle",talentTitle);
		
		//point update
		String name = request.getParameter("name"); // 쿠폰 id
		int getPoint = service.getPoint(talentMember); // 현재 보유 포인트
		log.info("현재포인" + getPoint);
		
		int plustPoint = getPoint+getmoney;
		log.info("더한값" + plustPoint);
		
		member.setMember_point(plustPoint); // 가져온 금액 + 해주기
		member.setMember_id(talentMember); //판매자 아이디로 설정
		service.updatePoint(member); // 포인트 업테이트
		
		//coupon update
		int couponName = Integer.parseInt(name);
		
		coupon.setCoupon_id(couponName);
		coupon.setMember_id(sessionId);
		log.info("쿠폰 아이디" +couponName);
		if(couponName != 0 || couponName != 5){
			service.updateCoupon(coupon);
		}
		///
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
		
		return "OrderCompleted";
		
	}
	

}
