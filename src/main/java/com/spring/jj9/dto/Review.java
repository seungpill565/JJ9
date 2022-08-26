package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Review {

    Integer review_id;
    String member_id;
    Integer talent_id;
    Integer review_grade;
    String review_content;
    Date review_date;

}
