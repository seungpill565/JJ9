package com.spring.jj9.admin.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.jj9.admin.alert.AlertPopup;
import com.spring.jj9.admin.service.CategoryService;
import com.spring.jj9.admin.service.CouponService;
import com.spring.jj9.admin.service.FaqService;
import com.spring.jj9.admin.service.MemberService;
import com.spring.jj9.admin.service.NoticeService;
import com.spring.jj9.admin.service.PayService;
import com.spring.jj9.admin.service.RefundService;
import com.spring.jj9.admin.service.TalentService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Coupon;
import com.spring.jj9.dto.Faq;
import com.spring.jj9.dto.Member;
import com.spring.jj9.dto.Notice;
import com.spring.jj9.dto.Talent_list;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class AdminController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	CategoryService cateService;
	
	@Autowired
	TalentService talentService;
	
	@Autowired
	PayService payService;
	
	@Autowired
	RefundService refundService;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	NoticeService noticeService;
	
	
	@GetMapping("/admin")
	public String goToAdmin(Model model , HttpSession session) {
		log.info("접속완료");
		log.info(memberService.getMember("admin1"));
		Member currUser= memberService.getMember("admin1");
		System.out.println(currUser);
		//접속한 아이디 정보를 세션에 저장
		session.setAttribute("currUser", currUser);	
		
		// 관리자 메인 페이지로 이동
		return "/admin/adminMain";
	}
	
	////////////////////////////// 카테고리 관리 ///////////////////////////////////
	@GetMapping("/categoryManage")
	public String categoryManage(Model model) {
		
		//카테고리 리스트를 categories에 담음
		model.addAttribute("categories", cateService.getCateList());
		
		//카테고리추가 페이지로 이동
		return "admin/categoryManage"; 
	}
	
	@PostMapping(value = "/addCategory")
	public String insertNewCate(Category cate) {
		
		cateService.addCate(cate);
		log.info(cate+ " 새 카테고리로 추가완료!!!");
		// 입력받은 카테고리 추가 후 카테고리추가 페이지로 이동
		return "redirect:/categoryManage"; 
	}
	
	@GetMapping("/deleteCategory")
	public void deleteCate(HttpServletResponse response,Integer id) throws IOException {	
		
		cateService.deleteCate(id);
		log.info(id + "번 카테고리 삭제완료");
		AlertPopup.alertAndMovePage(response, id +"번 카테고리 삭제 완료", "./categoryManage");
	}	
	
	@PostMapping("/updateCategory")
	public void updateCategory(HttpServletResponse response, Integer pre_id, Category new_category) throws IOException {		
		cateService.updateCate(pre_id, new_category);		  
		
		AlertPopup.alertAndMovePage(response, pre_id +"번 카테고리 수정 완료", "./categoryManage");
	}
	//////////////////////////////카테고리 관리 끝///////////////////////////////////
	
	
	////////////////////////////// 회원 관리 시작///////////////////////////////////
	@GetMapping("/memberManage")
	public String memberManage(Model model) {
		
		//멤버 리스트를 members에 담음
		model.addAttribute("members", memberService.getMemberList());	
		
		//회원관리 페이지로 이동
		return "admin/memberManage"; 
	}
	
	@GetMapping("/deleteMember")
	public void deleteMember(HttpServletResponse response, String id) throws IOException {	
		
		memberService.deleteMember(id);
		log.info(id + "번 회원 삭제완료");
		AlertPopup.alertAndMovePage(response, "회원삭제완료", "./memberManage");
	}	
	
	@PostMapping("/updateMember")
	public void updateMember(HttpServletResponse response, Member member) throws IOException {		
		memberService.updateMember(member);		  
		
		AlertPopup.alertAndMovePage(response, member.getMember_id() +"계정 수정 완료", "./memberManage");
	}
	////////////////////////////// 회원 관리 끝 ///////////////////////////////////
	
	
	////////////////////////////// 재능 관리 시작 ///////////////////////////////////
	
	@GetMapping("/talentPermission")
	public String talentPermission(Model model) {		
		//미승인 재능 리스트를 talents에 담음
		model.addAttribute("talents", talentService.getUnpermittedTalentList());			
		//재능 등록 승인 페이지로 이동
		return "admin/talentPermission"; 
	}
	//재능등록 요청관리에서의 수정
	@PostMapping("/updateTalent")
	public void updateTalent(HttpServletResponse response, Model model, Talent_list talent, Integer talent_id) throws IOException {
		
		//재능 정보 수정
		talentService.updateTalent(talent_id, talent);		
		
		//쿠폰 생성 알림 팝업 후 쿠폰 관리창으로 이동
		AlertPopup.alertAndMovePage(response, " 수정완료", "./talentPermission");
	}
	
	//재능관리에서의 수정
	@PostMapping("/updateTalent2")
	public void updateTalent2(HttpServletResponse response, Model model, Talent_list talent, Integer talent_id) throws IOException {
		
		//재능 정보 수정
		talentService.updateTalent(talent_id, talent);		
		
		//쿠폰 생성 알림 팝업 후 쿠폰 관리창으로 이동
		AlertPopup.alertAndMovePage(response, " 수정완료", "./talentManage");
	}
	
	@GetMapping("/permissionTalent")
	public void permissionTalent(HttpServletResponse response, int id) throws IOException {		
		
		talentService.permissionByTalentId(id);
			
		//승인 알림 팝업 후 재능등록 승인 페이지로 이동
		AlertPopup.alertAndMovePage(response, id +"번 재능 승인 처리완료", "./talentPermission");		
	}
	
	@GetMapping("/deleteTalent")
	public void deleteTalent(HttpServletResponse response, int id) throws IOException {		
		
		talentService.deleteTalent(id);			
		//승인 알림 팝업 후 이전 페이지로 이동
		AlertPopup.alertAndBackPage(response, id +"번 재능 삭제완료");		
	}
	
	@GetMapping("/talentManage")
	public String talentManage(Model model) {
		
		//멤버 리스트를 members에 담음
		model.addAttribute("talents", talentService.getTalentList());		
		//회원관리 페이지로 이동
		return "admin/talentManage"; 
	}	
	
	@GetMapping("/payLog")
	public String payLog(Model model) {		
		//pay 리스트를 payLogs에 담음
		model.addAttribute("payLogs", payService.getPayList());			
		//payLog 페이지로 이동
		return "admin/payLog"; 
	}	
	
	@GetMapping("/refundManage")
	public String refundManage(Model model) {
		
		//환불요청 리스트를 refundRequests에 담음
		model.addAttribute("refundRequests", refundService.getRefundList());
		
		//환불 완료 리스트를 refundCompleted에 담음
		model.addAttribute("refundCompleted", refundService.getRefundCompletedList());
		
		//refundManage 페이지로 이동
		return "admin/refundManage"; 
	}	
	@PostMapping("/refund")
	public String refund(Model model, int refund_id, String buyer_member_id, String seller_member_id, Integer pay_money, Integer pay_original_money) {
		
		//refund_id로 환불처리
		refundService.refund(refund_id);
		
		// 구매자 포인트 + 		
		memberService.updatePoint(buyer_member_id, pay_money);
		
		// 판매자 포인트 - 		
		memberService.updatePoint(seller_member_id, -pay_original_money);
		// 사용한 쿠폰도 조회후 돌려줘여함.
		
		//refundManage 페이지로 이동
		return "redirect:/refundManage"; 
	}
	
	@GetMapping("/confirmDeleteRefundRequest")
	public void confirmDeleteRefundRequest(HttpServletResponse response, int refund_id) throws IOException {
		
		AlertPopup.confirmAndMovePage(response, "삭제하시겠습니까?", "deleteRefundRequest?refund_id="+refund_id);			 
	}	
	
	@GetMapping("/deleteRefundRequest")
	public String deleteRefundRequest(Model model, int refund_id) {
		
		refundService.deleteRefundRequest(refund_id);		
		//refundManage 페이지로 이동
		return "redirect:/refundManage"; 
	}	
	
	
	@GetMapping("/couponManage")
	public String couponManage(Model model) {
		
		//pay 리스트를 payLogs에 담음
		model.addAttribute("coupons", couponService.getCouponList());		
		
		//랜덤 coupon_code 생성후 기존에 있던 쿠폰과 중복되지 않으면 random_code에 담음
		char[] charactor= {'A','B','C','D','E','F','G','F','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9'};
		StringBuilder builder = new StringBuilder();		
		
		while(builder.length() != 10 || !couponService.isCodeAvailable(builder.toString())) {
			
			builder = new StringBuilder();
			
			for(int i = 0; i < 10; i++) {
				builder.append(charactor[(int)(Math.random()*charactor.length)]);
			}
		}
		model.addAttribute("random_code", builder);
		
		//couponManage 페이지로 이동
		return "admin/couponManage"; 
	}	
	
	@PostMapping("/createNewCoupon")
	public void createNewCoupon(HttpServletResponse response, Model model, Coupon coupon) throws IOException {
		
		//새 쿠폰 생성
		couponService.createCoupon(coupon);
		
		//쿠폰 생성 알림 팝업 후 쿠폰 관리창으로 이동
		AlertPopup.alertAndMovePage(response, coupon.getCoupon_name()+ " 생성완료" +"\\n코드 : " +coupon.getCoupon_code()+"\\n만료 기간 : "+ coupon.getCoupon_period(), "./couponManage");
	}
	
	
	@GetMapping("/faqManage")
	public String faqManage(Model model) {
		
		model.addAttribute("faqs", faqService.getFaqList());		
		model.addAttribute("answeredFaqs", faqService.getAnsweredFaqList());
		
		return "admin/faqManage"; 
	}	
	
	@PostMapping("/answerFaq")
	public void faqAnswer(HttpServletResponse response, Model model, Integer faq_id, String faq_answer) throws IOException {
		
		// 문의 답변 등록
		faqService.answerFaq(faq_id, faq_answer);		
		//답변 등록 알림 후 1:1 문의 관리 페이지로 이동
		AlertPopup.alertAndMovePage(response, "답변 등록이 완료되었습니다","./faqManage");
	}
	
	@GetMapping("noticeManage")
	public String noticeManage(Model model) {
		
		model.addAttribute("notices", noticeService.getNoticeList());		
		return "admin/noticeManage"; 
	}
	
	@PostMapping("/updateNotice")
	public void updateNotice(HttpServletResponse response, Model model, Integer notice_id, Notice notice) throws IOException {
		
		// 공지사항 수정
		noticeService.updateNotice(notice_id, notice);		
		//수정 후 공지사항 관리 페이지로 이동
		AlertPopup.alertAndMovePage(response, "공지사항이 수정되었습니다","./noticeManage");
	}
}
