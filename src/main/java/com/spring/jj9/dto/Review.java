package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Review {

    private Integer review_id;
    private String member_id;
    private Integer talent_id;
    private Integer review_grade;
    private String review_content;
    private Date review_date;
    private Integer pay_id;

}
