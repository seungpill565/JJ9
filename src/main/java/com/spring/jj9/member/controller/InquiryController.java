package com.spring.jj9.member.controller;

import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.dto.Faq;
import com.spring.jj9.member.service.InquiryService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class InquiryController {

	InquiryService service;
	
	@Autowired
	public InquiryController(InquiryService service) {
		this.service = service;
	}
	
	@GetMapping("/account/inquiry")
	public String inquiry(HttpSession session, HttpServletRequest request) {
		try {
			String member_id = session.getAttribute("member_id").toString();			
		} catch (NullPointerException e) {
			request.setAttribute("msg", "로그인 후 사용할 수 있는 페이지입니다.");
			request.setAttribute("url", "/jj9/login");
			return "alert";			
		}
		
		return "account/inquiry";
	}
	
	@ResponseBody
	@PostMapping("/account/inquiry")
	public String postInquiry(
				@RequestParam("inquiry") String inquiry,
				@RequestParam("title") String title,
				@RequestParam("content") String content,
				HttpSession session,
				Faq faq
			) {
			
			log.info("inquiry : " + inquiry);
			log.info("title : " + title);
			log.info("content : " + content);
			
			String member_id = session.getAttribute("member_id").toString();
			log.info("member_id : " + member_id);
			
			LocalDate now = LocalDate.now();
			log.info("localDate : " + now);
			
			Date date = java.sql.Date.valueOf(now);
			
			// set하기
			
			faq.setFaq_title(title);
			faq.setFaq_content(content);
			faq.setFaq_date(date);
			
			log.info("faq한 날짜 : " + faq.getFaq_date());
			log.info("faq 타이틀 : " + faq.getFaq_title());
			log.info("faq 콘텐트 : " + faq.getFaq_content());
			if (inquiry == "") {
				return "-1";
			} else if (title == "") {
				return "-2";
			} else if (content == "") {
				return "-3";
			}
			
			// ★ inquiry, title, content 에서 오는 공백 처리
			// ☆ service, impl, mapper, xml 생성해야 함
			
			Integer row = service.inquire(date, inquiry, title, content, member_id);
			
			if (row == 1) { // 문의가 성공적으로 이루어짐
				return "1";
			} else {
				return "0";
			}
	}
}
