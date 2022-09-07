package com.spring.jj9.write;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.jj9.dto.Talent_list;
import com.spring.jj9.write.service.CateService;
import com.spring.jj9.write.util.ScriptAlertUtils;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class InsertTalentController {
	
	@Autowired
	CateService cateService;
	
	@PostMapping(value = "/insert")
	public String insertTalent(HttpServletRequest request, HttpServletResponse response) {
		
		// 파일 경로
		String savePath = Paths.get("target/talent").toString();
		
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
			
		
		    if (talent_price <= 0) {
		    	ScriptAlertUtils.alertAndBackPage(response, "올바르지 않은 가격입니다!");
		    }
		    
		    
		    if(
		    		cate_id == null || cate_id.equals("") ||
		    		member_id == null || member_id.equals("") ||
		    		talent_title == null || talent_title.equals("") ||
		    		talent_price == null || talent_price.equals("") ||
		    		talent_service_exp == null || talent_service_exp.equals("") ||
		    		talent_curriculum == null || talent_curriculum.equals("")
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
			tl.setMember_id(member_id);
			tl.setTalent_title(talent_title);
			// date를 오늘날짜로 set.
			tl.setTalent_date(talent_date);
			tl.setTalent_price(talent_price);				
			tl.setTalent_service_exp(talent_service_exp);
			tl.setTalent_curriculum(talent_curriculum);
			
			// Talent_list 테이블에 insert
			cateService.insertTalent(tl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/insert";
	
	}
	
}
