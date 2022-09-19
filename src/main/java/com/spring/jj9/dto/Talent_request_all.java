package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Talent_request_all {
	
	private Integer trequest_id;
	private String member_id;
	private String trequest_title;
	private String trequest_content;
	private Date trequest_date;
	private Date trequest_deadline;
	private Integer trequest_budget;
	private Integer cate_id;
	
	// 페이징 시 필요한 컬럼 테이블에는 속해있지 않다
    private    Integer   rn; //rownum

    // category

    private String cate_main;
    private String cate_sub;

    //Member

    private String member_password;
    private String member_email;
    private String member_phonenum;
    private Date member_birthday;
    private Integer member_point;
    private String member_name;
    private String member_nickname;
    private String member_comments;
	 

}
