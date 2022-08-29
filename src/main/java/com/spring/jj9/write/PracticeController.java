package com.spring.jj9.write;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.jj9.write.service.CateService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class PracticeController {
	
	@Autowired
	CateService cateService;
	
	@RequestMapping("/insert")
	public String insert(Model model) {
		
		model.addAttribute("mainCates", cateService.getCategories()); 
		
		return "write/insertTalent";
	}
	
}
