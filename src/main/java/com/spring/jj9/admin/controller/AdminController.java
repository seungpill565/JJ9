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
import com.spring.jj9.admin.service.MemberService;
import com.spring.jj9.admin.service.PayService;
import com.spring.jj9.admin.service.RefundService;
import com.spring.jj9.admin.service.TalentService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Member;

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
	
	@GetMapping("/deleteRefundRequest")
	public String deleteRefundRequest(Model model, int refund_id) {
		
		refundService.deleteRefundRequest(refund_id);
		
		//refundManage 페이지로 이동
		return "redirect:/refundManage"; 
	}	
	
	
	
	
}
