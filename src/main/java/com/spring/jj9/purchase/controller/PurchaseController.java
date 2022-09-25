package com.spring.jj9.purchase.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.purchase.service.PurchaseService;

@Controller
public class PurchaseController {
	
	String sessionId=null;
	
	@Autowired
	DataSource ds;
	
	@Autowired
	PurchaseService service;
	
	@GetMapping(value = "/purchase/{id}")
	public String PurchaseView(
			@PathVariable("id") int id,
			Model model,
			HttpSession session) {
		try {
			sessionId = session.getAttribute("member_id").toString();
			model.addAttribute("login",sessionId);
		}catch(NullPointerException e) {
			model.addAttribute("login","");
		}
		
	
		
		List<TalentAll> talentAll = service.getList(id);
		List<TalentAll> talentReivew = service.getReviewList(id);
		Double gradeAvg = service.getSumReviewGrade(id);
		
		int countGrade = service.getCountGrade(id);
		
		model.addAttribute("purchase",talentAll);
		model.addAttribute("Reivew",talentReivew);
		model.addAttribute("RradeAvg",gradeAvg);
		model.addAttribute("CountGrade",countGrade);
		
		 
		return "Purchase";
	}

}
