package com.spring.jj9.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Refund_request {	
	
	private Integer refund_id;
	private Integer pay_id;
	private String request_status;
	
}
