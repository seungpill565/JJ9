package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Talent_request {
	
	private Integer trequest_id;
	private String member_id;
	private String trequest_title;
	private String trequest_content;
	private Date trequest_date;
	private Date trequest_deadline;
	private Integer trequest_budget;
	private Integer cate_id;
	 
	//category
	
	private String cate_main;
	private String cate_sub;
}
