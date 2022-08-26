package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Free_board {

	private Integer fboard_id;
	private String member_id;
	private String fboard_title;
	private String fboard_content;
	private Date fboard_date;

}
