package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Member {
    private String member_id;
    private    String member_password;
    private String member_email;
    private String member_phoneNum;
    private Date member_birthday;
    private Integer member_point;
}