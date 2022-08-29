package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class TalentAll {
    //talent_list
         private    Integer    talent_id;
        private    Integer cate_id;
        private    String    member_id;
        private    String    talent_title;
        private    String    talent_image;
        private    Date    talent_date;
        private    Integer    talent_price;
        private    String    talent_service_exp;
        private    String    talent_curriculum;

        // category

        private String cate_main;
        private String cate_sub;

        //Member

        private String member_password;
        private String member_eamil;
        private String member_phoneNum;
        private Date member_birthday;
        private Integer member_point;


        //Review 

        private Integer review_id;
        private Integer review_grade;
        private String review_content;
        private Date review_date;


}