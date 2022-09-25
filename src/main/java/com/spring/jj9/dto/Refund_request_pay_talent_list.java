package com.spring.jj9.dto;


import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Refund_request_pay_talent_list {	
	//refund_request
	private Integer refund_id;
	private Integer pay_id;
	private String request_status;
	
	//pay	
	private Integer talent_id;
	private String buyer_member_id;
	private Integer pay_money;
	private Integer pay_original_money;
	private String refund_request;
	
	//talent_list	
    private Integer cate_id;
    private    String    seller_member_id;
    private    String    talent_title;
    private    String    talent_image;
    private    Date    talent_date;
    private    Integer    talent_price;
    private    String    talent_service_exp;
    private    String    talent_curriculum;
}
