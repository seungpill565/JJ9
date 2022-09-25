package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Faq {
    private Integer faq_id;
    private String  faq_cate;
    private String  faq_title;
    private String faq_content;
    private Date faq_date; 

    
    // 추가 한 부분
    private String member_id;
    private String faq_answer;

}
