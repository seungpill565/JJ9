package com.spring.jj9.member.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebAppConfiguration // 컨트롤러 테스트를 하려면 이게 필요하다.
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class ControllerTest {

	@Autowired
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void testSetup() {
		// 매 테스트마다 테스트 실행하기 전에(@Before) MockMvcBuilder로 새로운 MockMvc를 생성한다
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testMyPageController() {
		
		try {
			String nextView = mockMvc.perform(
				MockMvcRequestBuilders.get("/mypage")
			).andReturn().getModelAndView().getViewName(); 
			
			log.info("next view: " + nextView);
			assertEquals("alert", nextView);
		} catch (Exception e) {
			fail();
		}
	}
}
