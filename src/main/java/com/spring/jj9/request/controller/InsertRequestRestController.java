package com.spring.jj9.request.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.spring.jj9.add.service.CateService;
import com.spring.jj9.dto.Category;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class InsertRequestRestController {
	
	@Autowired
	CateService cateService;
	
	@GetMapping(value = "/insertRequest/{mainCate}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Category> getCategories(@PathVariable("mainCate") String mainCate) {
				
		return cateService.getCateByMain(mainCate);
	}
}
