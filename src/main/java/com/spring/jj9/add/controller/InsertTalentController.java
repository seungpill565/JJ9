package com.spring.jj9.add.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.jj9.add.service.CateService;
import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.util.ScriptAlertUtils;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class InsertTalentController {
	
	@Autowired
	CateService cateService;
	
	String session_id = null;
	
	@PostMapping(value = "/insert")
	public String insertTalent(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		try {
			session_id = session.getAttribute("member_id").toString();
		} catch (NullPointerException e) {
			try {
				ScriptAlertUtils.alertAndMovePage(response ,"로그인이 필요합니다. 로그인 페이지로 이동합니다.","/jj9/login");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		// 파일 경로
		String savePath = Paths.get("target/images").toString();
		
		log.info("파일경로 : " + savePath);
		
		
		
		// 파일 크기 제한 15MB
		final int MAX_SIZE = 15 * 1024 * 1024;
		
		// 파일 경로가 존재하지 않으면 만들어준다.
		File file = new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, savePath, MAX_SIZE, "utf-8", new DefaultFileRenamePolicy());
			
			String fileName = multi.getFilesystemName("image_file");
			
			String extension = "";
			
			if (fileName != null) {
				extension = fileName.split("\\.")[1];				
			}
			
			log.info("파일이름파일이름 : " + fileName);
			log.info("확장자 : " + extension);
			
			// jpg도 아니고 png도 아니고 jpeg도 아니면 빠꾸
			if(extension.equals("jpg") || extension.equals("png") || extension.equals("jpeg") || extension.equals("")) {
				
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "이미지 파일만 등록이 가능합니다!");
			}
			
			if (
					multi.getParameter("cate-sub") == null || multi.getParameter("cate-sub").equals("null") ||
					multi.getParameter("cate-sub").equals("")
					) {
			    ScriptAlertUtils.alertAndBackPage(response, "카테고리를 선택해주세요!");
			} else if (
					multi.getParameter("talent_price") == null || multi.getParameter("talent_price").equals("")
					) {
				ScriptAlertUtils.alertAndBackPage(response, "가격을 입력해주세요!");
			}
			
			
			Integer	cate_id = cateService.getCateIdBySub(multi.getParameter("cate-sub"));
			String	member_id = multi.getParameter("member_id");
		    String	talent_title = multi.getParameter("talent_title");
		    Date	talent_date	= Date.valueOf(LocalDate.now());
		    Integer	talent_price = Integer.parseInt(multi.getParameter("talent_price"));
		    String	talent_service_exp = multi.getParameter("talent_service_exp");
		    String	talent_curriculum = multi.getParameter("talent_curriculum");
		    Integer talent_workday = Integer.parseInt(multi.getParameter("talent_workday"));
		    String	talent_summary = multi.getParameter("talent_summary");
			
		
		    if (talent_price <= 0) {
		    	ScriptAlertUtils.alertAndBackPage(response, "올바르지 않은 가격입니다!");
		    }
		    
		    
		    if(
		    		cate_id == null || cate_id.equals("") ||
		    		member_id == null || member_id.equals("") ||
		    		talent_title == null || talent_title.equals("") ||
		    		talent_price == null || talent_price.equals("") ||
		    		talent_service_exp == null || talent_service_exp.equals("") ||
		    		talent_curriculum == null || talent_curriculum.equals("") ||
		    		talent_workday == null || talent_workday.equals("") ||
		    		talent_summary == null || talent_summary.equals("")
		    		) {
		    	ScriptAlertUtils.alertAndBackPage(response, "내용을 채워주세요!");
		    }
			
			// Talent list 객체 생성
			Talent_list tl = new Talent_list();
			
			if (fileName == null) {
				fileName = "";				
			}
			tl.setTalent_image(fileName);
			
			// getParameter를 이용해 객체에 데이터들을 set 해준다.
			tl.setCate_id(cate_id);
			tl.setMember_id(session_id);
			tl.setTalent_title(talent_title);
			// date를 오늘날짜로 set.
			tl.setTalent_date(talent_date);
			tl.setTalent_price(talent_price);				
			tl.setTalent_service_exp(talent_service_exp);
			tl.setTalent_curriculum(talent_curriculum);
			tl.setTalent_workday(talent_workday);
			tl.setTalent_summary(talent_summary);
			
			// Talent_list 테이블에 insert
			if (cateService.insertTalent(tl) == 1) {
				ScriptAlertUtils.alertAndBackPage(response, "등록이 완료되었습니다!");
				return "redirect:/mainpage";
			} else {
				ScriptAlertUtils.alertAndBackPage(response, "등록에 실패했습니다!");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/insert";
	
	}
	
}
