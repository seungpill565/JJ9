package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Notice {
    private Integer notice_id ;
    private String notice_title;
    private String notice_content ;
    private Date notice_date;
}