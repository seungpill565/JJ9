package com.spring.jj9.write;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.spring.jj9.dto.Category;
import com.spring.jj9.write.service.CateService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class InsertController {
	
	@Autowired
	CateService cateService;
	
	@GetMapping(value = "/insertTalent/{mainCate}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Category> getCategories(@PathVariable("mainCate") String mainCate) {
		
		log.info("메인카테고리 : " + mainCate);
		
		return cateService.getCateByMain(mainCate);
	}
}
