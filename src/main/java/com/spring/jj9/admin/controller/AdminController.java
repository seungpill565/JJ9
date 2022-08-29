package com.spring.jj9.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.jj9.admin.service.CategoryService;
import com.spring.jj9.admin.service.MemberService;
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
	
	@GetMapping("/admin")
	public String goToAdmin(Model model , HttpSession session) {
		log.info("접속완료");
		log.info(memberService.getMember("admin1"));
		Member currUser= memberService.getMember("admin1");
		
		//접속한 아이디 정보를 세션에 저장
		session.setAttribute("currUser", currUser);	
		// 관리자 메인 페이지로 이동
		return "/admin/adminMain";
	}
	@GetMapping("/addCateForm")
	public String addCateForm(Model model) {
		
		//카테고리 리스트를 categories에 담음
		model.addAttribute("categories", cateService.getCateList());
		
		//카테고리추가 페이지로 이동
		return "admin/addCateForm"; 
	}
	
	@PostMapping(value = "/addCategory")
	public String insertNewCate(Category cate) {
		
		cateService.addCate(cate);
		log.info(cate+ " 새 카테고리로 추가완료!!!");
		// 입력받은 카테고리 추가 후 카테고리추가 페이지로 이동
		return "redirect:/addCateForm"; 
	}
	
	@GetMapping("/delete")
	public String deleteCate(Integer id) {	
		
		cateService.deleteCate(id);
		log.info(id + "번 카테고리 삭제완료");
		return "redirect:/addCateForm";
	}
}
