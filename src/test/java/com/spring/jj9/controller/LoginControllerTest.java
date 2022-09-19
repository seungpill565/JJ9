package com.spring.jj9.controller;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.LoginService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class LoginControllerTest {
	
	private MockMvc mockMvc;
	
	@Autowired
	LoginService service;
	
	@Test
	public void loginTest() {
		com.spring.jj9.dto.Member member = new Member();
		member.setMember_id("gildong14");
		member.setMember_password("gildong14");
		String name = service.login(member);
		
		log.info(name + "님을 환영합니다!");
		
		assertEquals(name, "홍길동");
	}
	
}
