package com.spring.jj9.dto;

import java.sql.Date;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class TalentAll {
	//talent_list
	 	private    Integer   talent_id;
	    private    Integer cate_id;
	    private    String    member_id;
	    private    String    talent_title;
	    private    String    talent_image;
	    private    Integer    talent_workday;
	    private    String    talent_summary;
	    private    Date    talent_date;
	    private    Integer    talent_price;
	    private    String    talent_service_exp;
	    private    String    talent_curriculum;
	    private 	Integer talent_paycount;
	    private 	String talent_permission;
	    
	    // �럹�씠吏� �떆 �븘�슂�븳 而щ읆 / �뀒�씠釉붿뿉�뒗 �냽�빐�엳吏� �븡�떎
        private    Integer   rn; //rownum
	    
	    // category
	    
	    private String cate_main;
	    private String cate_sub;
	    
	    //Member
	    
	    private String member_password;
	    private String member_name;
	    private String member_email;
	    private String member_phoneNum;
	    private String  member_nickName;
	    private String member_comments;
	    
	    
	    //Review 
	    
	    private Integer review_id;
	    private Integer review_grade;
	    private String review_content;
	    private Date review_date;
	    
	
}