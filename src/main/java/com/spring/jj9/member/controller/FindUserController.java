package com.spring.jj9.member.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.FindUserService;
import com.spring.jj9.member.service.RegisterService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class FindUserController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	FindUserService service;
	
	@Autowired
	public FindUserController(FindUserService service) {
		this.service = service;
	}
	
	@GetMapping("find/user")
	public String findUserPage() {
		return "find/user";
	}
	
	@ResponseBody
	@PostMapping(value="find/findId", produces = MediaType.TEXT_PLAIN_VALUE)
	public String findId(@RequestParam String name, @RequestParam String phone) {
		log.info("FindUserController name 발송 여부 " + name);
		log.info("FindUserController phone 발송 여부 " + phone);
		
		String findId = service.findId(name, phone);
		log.info("컨트롤러로 돌아온 findId: " + findId);
		return findId;
	}
	
	// 비밀번호 잃어먹으면 그냥 update 되고, 이메일로 임시번호 전송
	@ResponseBody
	@PostMapping(value="find/updatePw", produces = MediaType.TEXT_PLAIN_VALUE)
	public String findPw(@RequestParam String id, @RequestParam String email) throws Exception {
		log.info("FindUserController id 발송 여부 " + id);
		log.info("FindUserController email 발송 여부 " + email);
		
		// 공백을 처리함
		if (id == null || id == "" ||
			email == null || email == "") {
			// 공백으로 들어온 id 와 email 을 1차적으로 최상단에서 처리합니다.
			return "-1";
		}
		
		// 발송은 됐는데 일단 id 가 있는 아이디인지, 이메일이 있는 이메일인지 확인해서 조회해야 함
		// user.jsp 에서 받은 id 가 있는 아이디면 nid 에 조회된 아이디가 담깁니다.
		String nid = service.getId(id, email);
		
		log.info("Controller 에서 회수 : " + nid);
		
		if (nid == null || nid == "") {
			// 조회 된 아이디가 없음을 alert로 띄웁니다.
			return "0";
		}
		
		// 임시 비밀번호를 발급 받아서
		String ranPassword = getRandomPassword();
		
		/*
		  위의 조건을 통과하면 아이디 확인이 완료된 것이므로 확인 된 nid로 바로 update,
		  ranPassword 를 파라미터로 보내서 비밀번호 업데이트, 동시에 이메일로 임시로 발급한 비밀번호를 전송합니다.
		*/
			// 업데이트
		Integer nPassword = service.updatePw(nid, ranPassword);
		log.info("Controller로 돌아온 nPassword: " + nPassword);
		
		// 메일을 발송하기 전에 nPassword 가 없으면 메일 발송 하지 않고 바로 return 시킵니다.
		if (nPassword == null || nPassword == 0) {
			return "-3";
		}
		
			// 메일 전송
		String subject = "jj9 재능구조대 임시 비밀번호입니다.";
        String from = "jj9 - <testjj9mail@naver.com>";
        String to = email; // 실제 이메일로 전송되니 유의해주세요
        String content = 
        		  "jj9 재능구조대 임시 비밀번호 발급 메일입니다."
        		+ "<br><br>"
        		+ "jj9 재능구조대에서는 보안을 위해 임시비밀번호 재발급을 통해 고객께서 직접 수정할 수 있도록 도와드리고 있습니다. "
        		+ "<br>"
        		+ "본인의 활동이 아니라면 메일을 무시해주세요."
        		+ "<br><br>"
        		+ "임시로 발급된 비밀번호는 [" + ranPassword +"] 입니다."
        		+ "<br>" 
        		+ "임시로 발급한 비밀번호는 보안이 취약하니 홈페이지에 다시 로그인하여 마이페이지에서 비밀번호 수정을 진행해주세요 :D"
        		+ "<br><br>"
        		+ "jj9 재능구조대 올림";
		
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
		
        // update 한 패스워드를 메일로 전송해서 메일로 전송했다는 것을 alert로 띄우기 위해 return 합니다.
		return "1";
	}
	
	// 임시 비밀번호 생성
	public String getRandomPassword() {
		  char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };

		  int idx = 0;
		  StringBuffer sb = new StringBuffer();
		  
		  System.out.println("charSet.length :::: "+charSet.length);
		  
		  for (int i = 0; i < 10; i++) {
			
			  idx = (int) (charSet.length * Math.random());
			  sb.append(charSet[idx]);
		  }

		  return sb.toString();
	}
}







