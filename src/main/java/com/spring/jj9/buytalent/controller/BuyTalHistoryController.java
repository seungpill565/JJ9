package com.spring.jj9.buytalent.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.jj9.buytalent.service.BuyHistoryService;
import com.spring.jj9.buytalent.service.BuyInfoService;
import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Pay_talentList;
import com.spring.jj9.dto.Review;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;
import com.spring.jj9.util.ScriptAlertUtils;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class BuyTalHistoryController {
	
	@Autowired
	BuyHistoryService buyService;
	
	@Autowired
	BuyInfoService buyInfoService;
	
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService mainservice;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	String session_id = null;
	
	@GetMapping(value = "account/refund/{pay_id}")
	public String refundRequest(@PathVariable("pay_id") Integer pay_id, HttpServletResponse response) {
		
		
		try {
			if(buyService.addRefundRequest(pay_id) == 1 &&
					buyService.updatePayRefundRequest(pay_id) == 1) {
				ScriptAlertUtils.alertAndBackPage(response, "환불 요청 되었습니다.");
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "환불 요청에 실패했습니다.");
			}		
		} catch (IOException e) {
			
		}
		
		return "account/purchase-history";
	}
	
	@GetMapping(value = "account/fix/{pay_id}")
	public String buyFix(@PathVariable("pay_id") Integer pay_id, HttpServletResponse response) {
		
		try {
			if(buyService.updateBuyFix(pay_id) == 1) {
				ScriptAlertUtils.alertAndBackPage(response, "구매확정 되었습니다.");
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "구매확정에 실패했습니다.");
			}		
		} catch (IOException e) {
			
		}
		return "account/purchase-history";
	}
	
	@GetMapping(value = "account/cancel/{pay_id}")
	public void refundCancel(@PathVariable("pay_id") Integer pay_id, HttpServletResponse response) {
		
		if(buyService.deleteRefundRequest(pay_id) == 1 &&
				buyService.updatePayRefundSetNull(pay_id) == 1) {
			try {
				ScriptAlertUtils.alertAndBackPage(response, "환불 요청이 취소되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping(value = "account/buyInfo/{pay_id}")
	public String buyInfo(@PathVariable("pay_id") Integer pay_id, Model model,  Criteria cri) {
		
		Pay_talentList ptl = buyInfoService.getPayTal(pay_id);
				
		String seller_id = ptl.getSeller_member_id();
		
		Review review = buyInfoService.reviewIsExist(pay_id);
		
		if (review == null) {
			model.addAttribute("exist", "0");
		} else {
			model.addAttribute("review", review);
		}
		
		model.addAttribute("payTal", ptl); 
		model.addAttribute("member", buyInfoService.getMember(seller_id));		
		
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
		
		return "account/buyinfo";
	}
	
	@PostMapping(value = "account/review")
	public void addReview(Review review, HttpServletResponse response, HttpSession session) {
		
		try {
			session_id = session.getAttribute("member_id").toString();
		} catch (NullPointerException e) {
			try {
				ScriptAlertUtils.alertAndMovePage(response ,"로그인 페이지로 이동합니다.","/jj9/login");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		try {
			if (review.getReview_grade() == null || review.getReview_grade().equals("")) {
				ScriptAlertUtils.alertAndBackPage(response, "별점을 입력해주세요!");
			} else if (review.getReview_content() == null || review.getReview_content().equals("")) {
				ScriptAlertUtils.alertAndBackPage(response, "평가를 입력해주세요!");
			}
		} catch (IOException e) {
			
		}
		
		review.setMember_id(session_id);
		review.setReview_date(Date.valueOf(LocalDate.now()));
		
		try {
			if (buyInfoService.addReview(review) == 1) {
				ScriptAlertUtils.alertAndBackPage(response, "리뷰가 등록되었습니다!");
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "리뷰 등록에 실패했습니다!");
			}			
		} catch (IOException e) {
			
		}	
	}
	
	@PostMapping(value = "account/modifyReview/{review_id}")
	public void modifyReview(@PathVariable("review_id") Integer review_id, Review review,  HttpServletResponse response) {
		
		try {
			if (buyInfoService.updateReview(review) == 1) {
				ScriptAlertUtils.alertAndBackPage(response, "리뷰가 수정되었습니다.");
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "리뷰 수정에 실패했습니다.");
			}
		} catch (IOException e) {
			
		}
		
	}
	
	@GetMapping(value = "account/deleteReview/{review_id}")
	public void deleteReview(@PathVariable("review_id") Integer review_id, HttpServletResponse response) {
		
		try {
			if (buyInfoService.deleteReview(review_id) == 1) {
				ScriptAlertUtils.alertAndBackPage(response, "리뷰가 삭제되었습니다.");
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "리뷰가 삭제에 실패했습니다");
			}
		} catch (IOException e) {
			
		}
	}
}








