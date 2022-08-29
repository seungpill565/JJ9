package com.spring.jj9.purchase.controller;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.purchase.service.PurchaseService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class PurchaseController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	PurchaseService service;
	
	@GetMapping(value = "/Purchase/{id}",produces = MediaType.APPLICATION_JSON_VALUE)
	public String getidpizza(@PathVariable("id") int id, Model model) {
		TalentAll talentAll = service.getList(id);
		
		model.addAttribute("Purchase",talentAll);
		 
		return "Purchase";
	}

}
