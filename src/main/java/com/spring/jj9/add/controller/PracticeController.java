package com.spring.jj9.add.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.add.service.CateService;
import com.spring.jj9.util.ScriptAlertUtils;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class PracticeController {
	
	@Autowired
	CateService cateService;
	
	String session_id = null;
	
	@RequestMapping("/insert")
	public String insert(Model model, HttpSession session, HttpServletResponse response) {
		
		try {
			session_id = session.getAttribute("member_id").toString();
		} catch (NullPointerException e) {
			try {
				ScriptAlertUtils.alertAndMovePage(response ,"로그인이 필요합니다. 로그인 페이지로 이동합니다.","/jj9/login");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		model.addAttribute("mainCates", cateService.getCategories()); 
		
		return "write/insertTalent";
	}
	
}