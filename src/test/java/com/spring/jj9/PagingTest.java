package com.spring.jj9;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.jj9.category.mapper.CategoryMapper;
import com.spring.jj9.category.service.CategoryService;
import com.spring.jj9.util.Criteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", // 자동완성 된다
				"file:src/main/webapp/WEB-INF/spring/root-context.xml"
				})
public class PagingTest {

	@Autowired 
	CategoryMapper mapper;
	
	@Autowired
	CategoryService service;
	
	@Test
	public void testreadTalentAllByMainCate() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		List list = mapper.readTalentAllForPagingByMainCate(cri, mapper.readCategoryById(1).get(0).getCate_main());
		list.forEach(board -> log.info(""+board));
	}
	
	@Test
	public void testreadTalentAllBySubCate() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		List list = mapper.readTalentAllForPagingBySubCate(cri, 11);
		list.forEach(board -> log.info(""+board));
	}
	
	@Test
	public void testreadTalentAllBySearch() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
	
		cri.setKeyword("1-1");
		List list = mapper.readTalentAllBySearch(cri);
		list.forEach(board -> log.info(""+board));
	}
}
