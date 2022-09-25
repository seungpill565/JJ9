package com.spring.jj9.dto;

import java.sql.Date;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Coupon {
	
	private Integer coupon_id ;
	private String coupon_code;
	private String coupon_name;
	private Date coupon_period;
	private String coupon_unused;
	private Integer discount_percent;
	private String member_id;

}
