package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PayMember {
	
	  private String member_id;
	    private String member_password;

	    private String member_email;
	    private String member_phoneNum;
	    private Date member_birthday;
	    private Integer member_point;


	    private String member_name;
	    private String member_nickName;
	    private String member_comments;
	    private String member_level;


	    //pay
	    private String member_rePassword;
	    private String check_id;
	    
	    private Integer pay_id;
		private Integer talent_id;
		private Integer pay_money;
		private Integer pay_original_money;
		
		//talent
		
	    private    Integer cate_id;	    
	    private    String    talent_title;
	    private    String    talent_image;
	    private    Integer    talent_workday;
	    private    String    talent_summary;
	    private    Date    	talent_date;
	    private    Integer    talent_price;
	    private    String    talent_service_exp;
	    private    String    talent_curriculum;

	    private 	Integer talent_paycount;
	    private 	String talent_permission;

}
