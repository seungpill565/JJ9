package com.spring.jj9.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.dto.Category;
import com.spring.jj9.dto.Member;
import com.spring.jj9.mainpage.service.MainpageService;
import com.spring.jj9.member.service.MyPageService;
import com.spring.jj9.request.service.RequestService;
import com.spring.jj9.util.Criteria;
import com.spring.jj9.util.PageMake;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class SecessionController {
	
	@Autowired
	MyPageService service;
	
	// 카테고리 갖고오는 서비스들~
	@Autowired
	private MainpageService mainservice;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
    RequestService reqservice;
	// 카테고리 갖고오는 서비스 끝
	
	@GetMapping("/account/secession")
	public String secession(HttpSession session, HttpServletRequest request, Model model, Criteria cri) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
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
		
		return "account/secession";
	}
	
	@ResponseBody
	@PostMapping("/account/user-secession")
	public String userSecession(@RequestParam String password, HttpSession session, Member member) {
		
		log.info("이것은 /account/user-secession 의 password : " + password);
		
		String member_id = session.getAttribute("member_id").toString();
		
		member = service.getMember(member_id);
		member.getMember_password();
		
		// 입력한 비밀번호와 db에 저장된 비밀번호 비교
		if (!member.getMember_password().equals(password)) {
			return "-1";
		}
		
		// 삭제된 행
		Integer row = service.deleteMember(member_id, password);
		
		log.info("delete 가 잘 돌아왔나요...? : " + row);
		
		if (row == 1) {
			session.invalidate(); // session 에서 없앰, 로그아웃 시킴
			return "1"; // delete가 원활하게 됨
		} else {
			return "0"; // delete가 원활하지 않았음
		}
		
	}
}
