package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Talent_list {
    private    Integer    talent_id;
    private Integer cate_id;
    private    String    member_id;
    private    String    talent_title;
    private    String    talent_image;
    private    Date    talent_date;
    private    Integer    talent_price;
    private    String    talent_service_exp;
    private    String    talent_curriculum;
}