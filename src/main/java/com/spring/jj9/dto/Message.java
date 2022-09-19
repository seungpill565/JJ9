package com.spring.jj9.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Message {
	
	private Integer message_id;
	private String message_name;
	private String message_content;
	private String sender_id;
	private String resiver;
	private Timestamp message_date;

}
