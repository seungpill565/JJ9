package com.spring.jj9.selltalent.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.jj9.dto.PayMember;
import com.spring.jj9.selltalent.service.SellTalentService;

@Controller
public class SelltalentController {
	
	@Autowired
	SellTalentService service; 
	
	@GetMapping("/sell-talent/{id}")
	public String ViewTalentList(
			@PathVariable("id") int id,
			Model model
			) {
		List<PayMember>memberInfo = service.getMemberInfo(id);
		if(memberInfo.size() == 0) {
			model.addAttribute("member","1");
		}else {
			model.addAttribute("member",memberInfo);
		}
		
		
		
		
		return "account/sell-talentMember";
		
	}
	@GetMapping("/del-talent/{id}")
	public String DelTalent(
			@PathVariable("id") int id,
			HttpServletRequest request
			) {
		service.delTalent(id);
		return "account/sell-talent";
		
	}

}
