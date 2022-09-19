package com.spring.jj9.message.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.message.service.MessageService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MessageController {
	
	@Autowired
	MessageService service;
	
	Integer talentid;
	
	@GetMapping(value = "/message/{id}")
	public String messageView (@PathVariable("id") int id, Model model) {
		TalentAll getid = service.getMemberId(id);
		model.addAttribute("id",getid);
		
		this.talentid = id;
		
		return "Message";
		
	}
	
	@PostMapping(value = "/message/info" )
	public String infoView ( Message message , HttpServletRequest req) throws IOException {
		String name = message.getMessage_name();
		String id = message.getSender_id();
		String content = message.getMessage_content();
		Timestamp date = Timestamp.valueOf(LocalDateTime.now());
		log.info(name);
		log.info(id);
		log.info(content);
		log.info(date);
		
		
		if(name == null || name.equals("")) {
			req.setAttribute("msg", "제목을 입력 해주세요.");
			req.setAttribute("url", "/jj9/message/"+talentid);
			return "Messagealert";
		}else if(content == null || content.equals("")){
			req.setAttribute("msg", "내용을 입력 해주세요.");
			req.setAttribute("url", "/jj9/message/"+talentid);
			return "Messagealert";
		}else {
			req.setAttribute("msg",  "쪽지를 보내셨습니다."); 
			message.setMessage_date(date);
			service.insertMessage(message);
			req.setAttribute("url", "jj9/info/"+id); //내정보로 이동할때 id 값 보내기
			return "Messagealert";
		}
		
	}

}
