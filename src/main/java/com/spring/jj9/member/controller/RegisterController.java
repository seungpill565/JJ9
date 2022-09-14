package com.spring.jj9.member.controller;

import java.io.IOException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jj9.dto.Member;
import com.spring.jj9.member.service.RegisterService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class RegisterController {
	

	@Autowired
	private JavaMailSender mailSender;
	
	// 이메일 인증번호
	private int authNumber;
	
	@RequestMapping(value = "/sendMailTest", method = RequestMethod.GET)
    public String sendMailTest() throws Exception{
        
        String subject = "test 메일";
        String content = "메일 테스트 내용";
        String from = "testjj9mail@naver.com";
        String to = "kevinj0695@naver.com";
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom("재능구조대 <testjj9mail@naver.com>");
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return "redirect:/main";
    }

	
	
	RegisterService service;
	
	@Autowired
	public RegisterController(RegisterService service) {
		this.service = service;
	}
	
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}
	
	@GetMapping("/list")
	public void memberListPage(Model model) {
		model.addAttribute("members", service.getMemberList());
	}
	
	@PostMapping("/register")
	public String registerMember(Member member, HttpServletRequest request) throws IOException {
		
		String member_id = member.getMember_id();
		String member_password = member.getMember_password();
		String member_rePassword = member.getMember_rePassword();
		
		String phone1 = member.getPhone1();
		String phone2 = member.getPhone2();
		String phone3 = member.getPhone3();
		
		String member_email = member.getMember_email();
		
		log.info("적은 아이디가 오는지 확인 " + member_id);
		log.info("비밀번호와 비밀번호 재확인 " + member_password);
		log.info("재확인 " + member_rePassword);
		
		log.info("phone 1 : " + phone1);
		log.info("phone 2 : " + phone2);
		log.info("phone 3 : " + phone3);
		
		String phoneNum = phone1 + "-" +  phone2 + "-" + phone3;
		member.setMember_phoneNum(phoneNum);
		
		if (
				member_id == null || member_id.equals("") ||
				member_password == null || member_password.equals("") ||
				member_rePassword == null || member_rePassword.equals("")
		) {
			request.setAttribute("msg", "아이디/비밀번호/비밀번호 재확인은 공백일 수 없습니다.\\n다시 시도해주세요");
			request.setAttribute("url", "/jj9/register");
			return "alert";
		} else if (!member_password.equals(member_rePassword)) {

			request.setAttribute("msg", "비밀번호가 일치하지 않습니다. \\n다시 입력해주세요");
			request.setAttribute("url", "/jj9/register");
			return "alert"; 
		} else {
			Integer id = service.insertMember(member);
				
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
			request.setAttribute("url", "/jj9/list");
			return "alert";		
		}
		
	}
	
	// ID 중복 확인, 유효성 검사
	@ResponseBody
	@PostMapping(value="/idCheck", produces = MediaType.TEXT_PLAIN_VALUE)
	public String idCheck(Member member, @RequestParam String ID, Model model) {
		
		log.info(ID);
		
		member.setCheck_id(ID);
		String chk_id = member.getCheck_id();
		log.info(chk_id);
		
		Integer row = service.idCheck(ID);
		
		if (row == 0) {
			return "0"; // 받는게 jquery 라 String 으로 보내야 인식함
		} else {
			return "-1";
		}
		
	} 
	
	// 이메일 본인인증
	@ResponseBody
	@PostMapping(value="/emailCheck", produces = MediaType.TEXT_PLAIN_VALUE)
	public String emailCheck(@RequestParam String email) throws Exception {
		log.info("RegisterController email 발송 여부 " + email);
		
		// 1. 이메일 정규표현식
		Boolean isEmail = isValidEmail(email);
		
		if (isEmail == false) {
			return "-1";
		}
		
		// 2. mailSender 로 보내서 인증
			// subject - 메일 제목, content - 메일 내용, from - 보내는 사람, to - 받는 사람
		String subject = "jj9 재능구조대 회원가입 인증번호입니다.";
        String from = "jj9 - <testjj9mail@naver.com>";
        String to = email;
        
        getRandomNum();
        
        String content = "jj9 재능구조대 홈페이지를 방문해주셔서 감사합니다."
        		+ "<br><br>"
        		+ "인증번호는 [" + authNumber + "] 입니다."
        		+ "<br>" 
        		+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
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
        
        
		return "0";
	}
		
	// 인증 번호 검증, 여기로 jsp 에서 작성한 인증번호가 날라와야 함
	@ResponseBody
	@PostMapping(value="/authNumCheck", produces = MediaType.TEXT_PLAIN_VALUE)
	public String authNumCheck(@RequestParam Integer authNum) {
		
		log.info("인증번호가 오는지 확인~~~~~ : " + authNum);
		log.info("static 한 변수가 유지가 되는지 확인: ~~~~" + authNumber);
		
		if (authNum == authNumber) {
			return "0";
		} else {
			return "-1"; 
		}
		
	}
	
	 /**
	 * Comment  : 이메일 검증.
	 */
	 public static boolean isValidEmail(String email) {
		 
		 boolean err = false;
		 
		 String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; 
		 
		 Pattern pattern = Pattern.compile(regex);
		 Matcher matcher = pattern.matcher(email);
		 
		 if(matcher.matches()) {
			 err = true; 
		 }
		 
		 return err;
	 }
	 
	 /**
	  * Comment : 난수 번호 생성 (이메일 인증번호가 될 번호)
	  */
	 public void getRandomNum() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			authNumber = checkNum;
	 }
}
