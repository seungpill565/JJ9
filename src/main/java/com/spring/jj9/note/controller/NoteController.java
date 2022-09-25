package com.spring.jj9.note.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoteController {
	
	@GetMapping(value = "/note")
	public String noteMessageView(HttpServletRequest request,Model model) {
		
		String message = request.getParameter("conntent");
		
		model.addAttribute("message",message);
		
		return "notecheck";
		
	}

}
